Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F400733639
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030EF10E65E;
	Fri, 16 Jun 2023 16:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5C910E65E;
 Fri, 16 Jun 2023 16:36:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZpubQ13XYHV6YlDbBz3IGUvEkL33C1zc/t6T3oN/8fAc7w3WaYFCkKomuzAqh47FEg5/0CwAtEOeToHJivDxCOm+xQBPufxfkeI3xScUq9A9I7MC7pP704GwGGHHdCkWWHPl1VTGXk9wfLqeqztelBgZ+hS3LuBdsqcoNYsM5FPNuw0Ctfkz9STnQlP5PpW/hMBZ3wJ5E0QmLNWcoQE4BnA79GanErxQq1QN8/sJxgkO5uRXhpCtAy04BzgzZ0SxRfgQnDDHrMJLajiFA9KsSPbpYMxtXj7c/7SDLoktEeT6kwFP69lcb2afiUGtmLuBY/xK6VQ6nZlXl1n3q0xEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDRUj5dQnx8h8PGBEbMDhoMhblKRzrqxgWuJkGa7HYw=;
 b=jBc332mhvsP59+SzxSUhdeEueUOygvm4r4NMxWnbu+ScZNhXc/eO3QlKN3dhcLOgn3FEm6A7V3Mu62Bczvwpq1WpD/XuDvgXno7oyhGvFdFtWdbML3afOe81GCOcsE6s5CafeticgT0skRvIG1HxoNIzDnQ4kuexD1k3+gvBoyhLCddIYnO9UliwmCajUtQRlVYGXoCT3E0VNKcmupJX38tMSCsM7CCh1zFgKIslLQu9La5xzvKu+88RNIwspQ6lCqnDX3oWXsDcTpp22XlTOnqgfHVi5cuhvYhx6mmscUU8olk4Gd8g4EOHRAowA/icVxUtNd9PrnaAu5ffbTv79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDRUj5dQnx8h8PGBEbMDhoMhblKRzrqxgWuJkGa7HYw=;
 b=aM4nGGEYmsQ2mPUR2ZSQe9++UsKS41ss6FztyFxuXExHB4SFWusPtAID5LZ+2/J5xqv6jpPpewuAESP2RAA7fCBPLDu9/Pc63kU7cuiHAGI6u+5Er2ay6ySHBxvA311M8GSNnr7y2i0mdAgFN8Y3XtpBZbXncG9MAwCTY44MiB4=
Received: from BN9PR03CA0904.namprd03.prod.outlook.com (2603:10b6:408:107::9)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 16:36:02 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::80) by BN9PR03CA0904.outlook.office365.com
 (2603:10b6:408:107::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Fri, 16 Jun 2023 16:36:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.29 via Frontend Transport; Fri, 16 Jun 2023 16:36:01 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 11:36:00 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, drm, scheduler, UAPI drm-next-6.5
Date: Fri, 16 Jun 2023 12:35:48 -0400
Message-ID: <20230616163548.7706-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 1237ad77-d50d-4054-11ea-08db6e87c5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVUhhK5Dw5QOLYU/m408gguv3c0WDCd9FJXfE9kZH2BQ1+BICTTWaAYY+YwxdjVucivF3lsXAX6FAmaLh5jwUb1dFrkqMognmy18bdURFOtG9IqnAtK+jBiqWhbrENn07G3jZqnO1/UlYtRyBVxbTWHEds3IOkOWAmhx+h2vas1XX84GVj9TvpWv7R6Mwh680r3akwQg60FN6J0nb3YjIYyR8ZDDRRtrs1tQn+QtoR+KY+M/3HtjyvffaI0U4gTTkiHORVb5Vq/GGs5XOJHKNpqfaWtQkRkP+xNaclJ3PZkP7fDQBlRR2UKk19QiOQ1bbRCaZXrxCIB8ltPMUoDmVAX3KtevpcKW3x/eKlRnLM6npbPRQsR4EFMXjBnjCfA4uiuNIA7Qvj1DvTFxq4zLmhVm5S7n7r4wzPpXzCvi8QIlZzE5m1/NcSfvN3vsVpDGLG5ftzna4ot8yOciR1axmOQus6DL/DYnjDUflLoW6Y4+iR3S+SPYQsP+B5JkUw94+y4rRPjfa357S8rKTLXPrEfNPFMA/BfyQ1vhnApUDipIPXfNXzwAL2nMImuwmUin70PXVaKc9k1SuX+vt5RqOifCYXL9yMVhNpjL996HWKP02u3hOUsFA3Kn9yKS/sUrlc5yl/nUh3YfAniJu1WKMlwq/AJSXlxZkTTbzN4t+GRtomgaevy+oJaDEXVKRvH4wkX4zQLTuGcwjSh1XwEYnSMTFOr/fQk9nagWfoTkegI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(356005)(81166007)(82310400005)(86362001)(82740400003)(5660300002)(316002)(8936002)(8676002)(41300700001)(4326008)(70206006)(70586007)(36860700001)(83380400001)(66574015)(47076005)(426003)(110136005)(2616005)(336012)(186003)(1076003)(16526019)(478600001)(26005)(36756003)(40460700003)(2906002)(30864003)(7696005)(966005)(40480700001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 16:36:01.8354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1237ad77-d50d-4054-11ea-08db6e87c5a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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

Last few odds and ends for 6.5.  Mostly bug fixes.  Was waiting on some
GPU scheduler changes in drm-misc for a few of the GPU reset fixes in amdgpu.

The following changes since commit 901bdf5ea1a836400ee69aa32b04e9c209271ec7:

  Merge tag 'amd-drm-next-6.5-2023-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-06-15 14:11:22 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.5-2023-06-16

for you to fetch changes up to 72f1de49ffb90b29748284f27f1d6b829ab1de95:

  drm/dp_mst: Clear MSG_RDY flag before sending new message (2023-06-15 17:55:41 -0400)

----------------------------------------------------------------
amd-drm-next-6.5-2023-06-16:

amdgpu:
- Misc display fixes
- W=1 fixes
- Improve scheduler naming
- DCN 3.1.4 fixes
- kdoc fixes
- Enable W=1
- VCN 4.0 fix
- xgmi fixes
- TOPDOWN fix for large BAR systems
- eDP fix
- PSR fixes
- SubVP fixes
- Freesync fix
- DPIA fix
- SMU 13.0.5 fixes
- vblflash fix
- RAS fixes
- SDMA 4 fix
- BO locking fix
- BO backing store fix
- NBIO 7.9 fixes
- GC 9.4.3 fixes
- GPU reset recovery fixes
- HMM fix

amdkfd:
- Fix NULL check
- Trap fixes
- Queue count fix
- Add event age tracking

radeon:
- fbdev client fix

scheduler:
- Avoid an infinite loop

UAPI:
- Add KFD event age tracking:
  Proposed ROCT-Thunk-Interface:
  https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/commit/efdbf6cfbc026bd68ac3c35d00dacf84370eb81e
  https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/commit/1820ae0a2db85b6f584611dc0cde1a00e7c22915
  Proposed ROCR-Runtime:
  https://github.com/RadeonOpenCompute/ROCR-Runtime/compare/master...zhums:ROCR-Runtime:new_event_wait_review
  https://github.com/RadeonOpenCompute/ROCR-Runtime/commit/e1f5bdb88eb882ac798aeca2c00ea3fbb2dba459
  https://github.com/RadeonOpenCompute/ROCR-Runtime/commit/7d26afd14107b5c2a754c1a3f415d89f3aabb503

drm:
- DP MST fix

----------------------------------------------------------------
Alex Deucher (4):
      Revert "drm/amd/display: fix dpms_off issue when disabling bios mode"
      drm/amd/display: don't free stolen console memory during suspend
      drm/amdgpu/sdma4: set align mask to 255
      drm/amdgpu: mark GC 9.4.3 experimental for now

Alvin Lee (4):
      drm/amd/display: SubVP high refresh only if all displays >= 120hz
      drm/amd/display: Re-enable SubVP high refresh
      drm/amd/display: Block SubVP + DRR if the DRR is PSR capable
      drm/amd/display: Include CSC updates in new fast update path

Aric Cyr (2):
      drm/amd/display: Promote DAL to 3.2.238
      drm/amd/display: 3.2.239

Artem Grishin (1):
      drm/amd/display: Bug fix in dcn315_populate_dml_pipes_from_context

Arunpravin Paneer Selvam (1):
      Revert "drm/amdgpu: remove TOPDOWN flags when allocating VRAM in large bar system"

Austin Zheng (2):
      drm/amd/display: Add DP2 Metrics
      drm/amd/display: Limit Minimum FreeSync Refresh Rate

Candice Li (3):
      drm/amd/pm: Align eccinfo table structure with smu v13_0_0 interface
      drm/amdgpu: Update total channel number for umc v8_10
      drm/amdgpu: Add channel_dis_num to ras init flags

Christian König (8):
      drm/amdgpu: make sure BOs are locked in amdgpu_vm_get_memory
      drm/amdgpu: make sure that BOs have a backing store
      drm/amdgpu: add amdgpu_error_* debugfs file
      drm/amdgpu: mark force completed fences with -ECANCELED
      drm/amdgpu: mark soft recovered fences with -ENODATA
      drm/amdgpu: abort submissions during prepare on error
      drm/amdgpu: reset VM when an error is detected
      drm/amdgpu: add VM generation token

Daniel Miess (2):
      drm/amd/display: Enable dcn314 DPP RCO
      drm/amd/display: Re-enable DPP/HUBP Power Gating

Dmytro Laktyushkin (1):
      drm/amd/display: fix pixel rate update sequence

Fangzhi Zuo (1):
      drm/amd/display: Add Error Code for Dml Validation Failure

Hamza Mahfooz (1):
      drm/amd/amdgpu: enable W=1 for amdgpu

Hersen Wu (2):
      drm/amd/display: edp do not add non-edid timings
      drm/amd/display: add debugfs for allow_edp_hotplug_detection

James Zhu (5):
      drm/amdkfd: add event age tracking
      drm/amdkfd: add event_age tracking when receiving interrupt
      drm/amdkfd: set activated flag true when event age unmatchs
      drm/amdkfd: update user space last_event_age
      drm/amdkfd: bump kfd ioctl minor version for event age availability

Jonathan Kim (2):
      drm/amdkfd: fix null queue check on debug setting exceptions
      drm/amdkfd: decrement queue count on mes queue destroy

Lee Jones (1):
      drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef

Lijo Lazar (4):
      drm/amdgpu: Release SDMAv4.4.2 ecc irq properly
      drm/amdgpu: Change nbio v7.9 xcp status definition
      drm/amdgpu: Use PSP FW API for partition switch
      drm/amdgpu: Remove unused NBIO interface

Likun Gao (1):
      drm/amdgpu: add wait_for helper for spirom update

Luben Tuikov (2):
      drm/amdgpu: Report ras_num_recs in debugfs
      drm/amdgpu: Fix usage of UMC fill record in RAS

Ma Jun (1):
      drm/amdgpu: Print client id for the unregistered interrupt resource

Mukul Joshi (2):
      drm/amdgpu: Rename DRM schedulers in amdgpu TTM
      drm/amdkfd: Remove DUMMY_VRAM_SIZE

Nicholas Kazlauskas (1):
      drm/amd/display: Skip DPP DTO update if root clock is gated

Peichen Huang (1):
      drm/amd/display: limit DPIA link rate to HBR3

Philip Yang (2):
      drm/amdgpu: Enable translate further for GC v9.4.3
      drm/amdgpu: Increase hmm range get pages timeout

Ruili Ji (1):
      drm/amdkfd: To enable traps for GC_11_0_4 and up

Saaem Rizvi (1):
      drm/amd/display: Do not disable phantom pipes in driver

Samson Tam (1):
      Revert "drm/amd/display: reallocate DET for dual displays with high pixel rate ratio"

Shiwu Zhang (1):
      drm/amdgpu: expose num_hops and num_links xgmi info through dev attr

Sonny Jiang (1):
      drm/amdgpu: vcn_4_0 set instance 0 init sched score to 1

Srinivasan Shanmugam (10):
      drm/amdgpu: Fix kdoc warning
      drm/amdgpu: Fix memcpy() in sienna_cichlid_append_powerplay_table function.
      drm/amdgpu: Add missing function parameter 'optc' & 'enable' to kdoc in optc3_set_timing_double_buffer()
      drm/amd/display: Correct kdoc formats in dcn10_opp.c
      drm/amd/display: Correct and remove excess function parameter names in kdoc
      drm/amd/display: Provide function name for 'optc32_enable_crtc()'
      drm/amd/display: Correct kdoc formats in dcn32_resource_helpers.c
      drm/amd/display: Clean up dcn10_optc.c kdoc
      drm/radeon: Fix missing prototypes in radeon_atpx_handler.c
      drm/amd/display: Convert to kdoc formats in dc/core/dc.c

Stanley.Yang (2):
      drm/amdgpu: Optimize checking ras supported
      drm/amdgpu: Add checking mc_vram_size

Thomas Zimmermann (1):
      drm/radeon: Disable outputs when releasing fbdev client

Tim Huang (3):
      drm/amd/pm: fix vclk setting failed for SMU v13.0.5
      drm/amd/pm: enable vclk and dclk Pstates for SMU v13.0.5
      drm/amd/pm: enable more Pstates profile levels for SMU v13.0.5

Tom Chung (2):
      drm/amd/display: fix the system hang while disable PSR
      drm/amd/display: Fix disbling PSR slow response issue

Wayne Lin (1):
      drm/dp_mst: Clear MSG_RDY flag before sending new message

ZhenGuo Yin (2):
      drm/amdgpu: add entity error check in amdgpu_ctx_get_entity
      drm/scheduler: avoid infinite loop if entity's dependency is a scheduled error fence

 drivers/gpu/drm/amd/amdgpu/Makefile                |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  25 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  23 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  23 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  18 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  34 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 176 ++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  46 ++++++
 .../gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c    |   3 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  18 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  18 +--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.h             |   2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  20 ++-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   5 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  46 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_events.h            |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  65 +++++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  32 ++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  36 ++---
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  70 ++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |   9 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   2 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |  20 ++-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  57 ++++---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  11 --
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   1 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   1 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |   8 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   5 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   9 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  27 +++-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  11 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   7 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   4 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 147 ++++++++++++-----
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  59 +++++++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 178 +++++++++++++--------
 .../drm/amd/display/dc/dml/display_mode_enums.h    |   8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |  32 ++++
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   5 +
 .../drm/amd/display/modules/freesync/freesync.c    |  11 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  18 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  80 ++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.h   |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  54 ++++++-
 drivers/gpu/drm/i915/display/intel_dp.c            |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  12 +-
 drivers/gpu/drm/radeon/radeon_acpi.h               |   9 ++
 drivers/gpu/drm/radeon/radeon_atpx_handler.c       |   2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |   2 +-
 include/drm/display/drm_dp_mst_helper.h            |   7 +-
 include/uapi/linux/kfd_ioctl.h                     |  13 +-
 93 files changed, 1222 insertions(+), 431 deletions(-)
