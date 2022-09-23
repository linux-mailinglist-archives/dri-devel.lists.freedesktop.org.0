Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768865E8535
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 23:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3662910E9AA;
	Fri, 23 Sep 2022 21:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A5D10E26D;
 Fri, 23 Sep 2022 21:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b04Bd4TWwUrS27mecZzAopcTDAZDy9FusaWJdWIwkDJ2GCvud7tehy2/9r8Oix8m8u0cI6rut7HgpFc8+egdwO9+FOwTFOl5LRioQr9oZiE9AJBFG98aRl2ZvtfrE2SsO7JIDR25UgElQC9VpUjpzaG86718uVSPVLvzrLW5QOYpeioN6XskaPjA25lIvEJiPf7yFxpun3yzztREHUT1YgC+UP1FbI/tzZNzkz4UPeRprqxDllGDw+cRZc2Eu3kDx4BIZSoDLs5nPeByI6O8oOfqyO1uYOxrvZd0XlveWD5XdUAqgGukE3QItAD2N2Qsf1fU8+t9/TGcOWEQyBLEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43JRMBlCGgwDeFe8K7yNqCbND4JyfRaVa3Sk39N5/yk=;
 b=ZVQHa2n4eHD+Fu+1MQNv9UmRNSoKNrT//ecDiaiqkRAxSAdxCTCu2Rr1VPFoX4bAEQspv9GDkfsWRC+IMk6uBJiUvVoC30eclQNw2aZeL9O507Wi7JGp3KHuJ2Q/RPYdNwlt030t1gDY/16D35MYXwUCVp4TyO45QpHNgvnnSrxG0gUgz2wGHD7QNnIn7rsHjaoobvlblapOlR9nk468oRmK9cjPmrlhLe8rmPgSnYxSKn0wLK0mI8oC6/NdK+UxS2fzoinEpzjpZzgREpOgVJ6CbK4mVewPqRgLYGhsOHObdLHwlPj0gwMXVGjSRpfaLj93sRwOaywXRidUPc+kbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43JRMBlCGgwDeFe8K7yNqCbND4JyfRaVa3Sk39N5/yk=;
 b=lMWN11lCgc8OHrgYexKdoj98YOPG/xQexHzMy0Yc3orBup6s10BLPzlhnO+VW0muBADwjzM9ILUXNFmzSfb+cv7SugKynTG3p3t5EPkmZ0gH0AwPKkRq/QPrWPYmjT+anf3Y3RG/Uv1KK5lAeDPQLhTfhPW54/MZXC03BjOrboI=
Received: from MW4PR03CA0076.namprd03.prod.outlook.com (2603:10b6:303:b6::21)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 21:57:46 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::8a) by MW4PR03CA0076.outlook.office365.com
 (2603:10b6:303:b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 21:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 21:57:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 16:57:43 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.1
Date: Fri, 23 Sep 2022 17:57:29 -0400
Message-ID: <20220923215729.6061-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT036:EE_|SA0PR12MB4368:EE_
X-MS-Office365-Filtering-Correlation-Id: e87b9a38-2cdb-43f5-a106-08da9daea5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MK5A99JGOs0LoevPQFMwZQPQIn67iWqHt8HxW3Goegvpd10jwOp10ePTfiMTMR4zugNbur5ZzdHsdBzQ66bCWWaygYakILtTUBXnKuXzlyYtmCRWGNj9R6nUzSRyXraKaVx5x2Vpr1JF8Z87ohHzRV86TUkg15uOr0mCrBL8Fcq35lzfo3GbOBdftiNt3Y5Olpr6pIamxAMe4kFpdKlbqxHoGnP6LWj7Yel9NZ1Z/mD042DgtzJmUqBcQZa38i4qI/id1E2gnMSa3CuVXL4Pg4ybkK8t1A19kZXtsVE40vpxmE0bJmO++Z3G1pcYDvc+CbwkLobsIpDfG0qYcLqmaQTOfxl+LcXXIHWMhkFbxazq+qOFXrMeZXwhr7gMjty5VzsGmFlcFl9AMpoSP/aXPvCh4TEdHDusQGIZTRV+EFoXW52zY/r/igs9cvQ6y69QUfBWkr+Mkx7Pd61g8gJ0tlTND7FwyPYvpyQxgAlY9FX/ELx1OJxJwV6hrop23Vu4HotsYypeBpSuN4EKH9tIPGGNi0UX5udTlqfNzIAzk64XQSwr3OkP2GZRMCi//R11Hr4F2exruYTB1PRIAvyxAoTaBAwca808J9vPDy5HuugR3DBs1k9hsxk+etrHDKE6YMK+ldhG1rjaAWEh2C5L7y5AMJYtYcfE7rpG/3iNJLIcTTH34/MPdoRmH/6Fri29aX3jWZTi24OOnO6gRWjNJc0/huJ/ykqs6zquX/1pEWsjRkhLK6FGnJ/dy70V2BLK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(316002)(41300700001)(86362001)(30864003)(36756003)(81166007)(2906002)(5660300002)(70206006)(8936002)(82740400003)(356005)(70586007)(4326008)(40460700003)(966005)(8676002)(47076005)(66574015)(36860700001)(110136005)(16526019)(186003)(83380400001)(26005)(336012)(82310400005)(426003)(40480700001)(6666004)(7696005)(2616005)(1076003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 21:57:45.8024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87b9a38-2cdb-43f5-a106-08da9daea5eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368
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

A few more new things for 6.1.  Mostly bug fixes, the new feature here
is gang submission support for mesh shaders in Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/18367

The following changes since commit dacd2d2d9d800b7ab2ee2734578112532cba8105:

  drm/amd/display: fix boolconv.cocci warning (2022-09-14 12:38:53 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.1-2022-09-23

for you to fetch changes up to 3e43b760c9e14fc0b7bd553efb01d9ca825cf338:

  drm/amdgpu: Fix amdgpu_vm_pt_free warning (2022-09-21 15:25:52 -0400)

----------------------------------------------------------------
amd-drm-next-6.1-2022-09-23:

amdgpu:
- SDMA fix
- Add new firmware types to debugfs/IOCTL version queries
- Misc spelling and grammar fixes
- Misc code cleanups
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- CS cleanup
- Gang submit support
- Clang fixes
- Non-DC audio fix
- GPUVM locking fixes
- Vega10 PWN fan speed fix

amdkgd:
- MQD manager cleanup
- Misc spelling and grammar fixes

UAPI:
- Add new firmware types to the FW version query IOCTL

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: don't register a dirty callback for non-atomic

Alvin Lee (10):
      drm/amd/display: Fix pipe split prediction
      drm/amd/display: Only consider pixle rate div policy for DCN32+
      drm/amd/display: For ODM seamless transition require AUTO mode
      drm/amd/display: Add debug option for allocating extra way for cursor
      drm/amd/display: SubVP pipe split case
      drm/amd/display: Disable SubVP on driver disable
      drm/amd/display: Fix SubVP way calculation
      drm/amd/display: Uncomment SubVP pipe split assignment in driver
      drm/amd/display: Don't allocate DET for phantom pipes
      drm/amd/display: Do second pass through DML for DET calculation

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.134.0

Aric Cyr (2):
      drm/amd/display: 3.2.203
      drm/amd/display: 3.2.204

Aurabindo Pillai (2):
      drm/amd/display: Remove some unused definitions from DCN32/321
      drm/amd/display: Enable committing subvp config

Charlene Liu (4):
      drm/amd/display: add debug option for dramclk_change_latency in apu
      drm/amd/display: Expose few dchubbub functions
      drm/amd/display: update dccg based on HW delta
      drm/amd/display: correct num_dsc based on HW cap

Chris Park (1):
      drm/amd/display: Port DCN30 420 logic to DCN32

Christian König (9):
      drm/amdgpu: cleanup CS pass2 v6
      drm/amdgpu: cleanup error handling in amdgpu_cs_parser_bos
      drm/amdgpu: move entity selection and job init earlier during CS
      drm/amdgpu: revert "fix limiting AV1 to the first instance on VCN3" v3
      drm/amdgpu: cleanup instance limit on VCN4 v4
      drm/amdgpu: add gang submit backend v2
      drm/amdgpu: add gang submit frontend v6
      drm/amdgpu: properly initialize return value during CS
      drm/amdgpu: bump minor for gang submit

Colin Ian King (1):
      drm/amdkfd: Fix spelling mistake "detroyed" -> "destroyed"

Cruise Hung (1):
      drm/amd/display: Fix DP MST timeslot issue when fallback happened

Daniel Miess (1):
      drm/amd/display: Add shift and mask for ICH_RESET_AT_END_OF_LINE

Dmytro Laktyushkin (2):
      drm/amd/display: fix dcn315 memory channel count and width read
      drm/amd/display: increase dcn315 pstate change latency

Evan Quan (2):
      drm/amd/pm: add support for 3794 pptable for SMU13.0.0
      drm/amd/pm: drop the pptable related workarounds for SMU 13.0.0

George Shen (2):
      drm/amd/display: Fix urgent latency override for DCN32/DCN321
      drm/amd/display: Update dummy P-state search to use DCN32 DML

Hawking Zhang (4):
      drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
      drm/amdgpu: support print rlc v2_x ucode hdr
      drm/amdgpu: add two new subquery ids
      drm/amdgpu: add rlcv/rlcp version info to debugfs

Hugo Hu (1):
      drm/amd/display: update gamut remap if plane has changed

Ian Chen (1):
      drm/amd/display: Refactor edp panel power sequencer(PPS) codes

Jaehyun Chung (1):
      drm/amd/display: Assume connectors are on single slot

Josip Pavic (2):
      drm/amd/display: do not compare integers of different widths
      drm/amd/display: log vertical interrupt 1 for debug

Leo Chen (1):
      drm/amd/display: Various logs added

Leo Li (1):
      drm/amd/display: Fix double cursor on non-video RGB MPO

Meenakshikumar Somasundaram (1):
      drm/amd/display: Display distortion after hotplug 5K tiled display

Michael Strauss (1):
      drm/amd/display: Assume an LTTPR is always present on fixed_vs links

Mukul Joshi (1):
      drm/amdgpu: Update PTE flags with TF enabled

Nathan Chancellor (2):
      drm/amd/display: Reduce number of arguments of dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml314's CalculateFlipSchedule()

Nicholas Kazlauskas (1):
      drm/amd/display: Disable OTG WA for the plane_state NULL case on DCN314

Pavle Kotarac (2):
      drm/amd/display: Added new DCN301 Asic Id
      drm/amd/display: Removing 2 phys

Philip Yang (8):
      drm/amdgpu: SDMA update use unlocked iterator
      drm/amdgpu: Rename vm invalidate lock to status_lock
      drm/amdgpu: Use vm status_lock to protect relocated list
      drm/amdgpu: Use vm status_lock to protect vm idle list
      drm/amdgpu: Use vm status_lock to protect vm moved list
      drm/amdgpu: Use vm status_lock to protect vm evicted list
      drm/amdgpu: Use vm status_lock to protect pt free
      drm/amdgpu: Fix amdgpu_vm_pt_free warning

Robin Chen (1):
      drm/amd/display: Revise Sink device string ID

Rodrigo Siqueira (1):
      drm/amd/display: Ignore k1/k2 values for virtual signal

Sherry Wang (1):
      drm/amd/display: correct hostvm flag

Shiwu Zhang (1):
      drm/amdkfd: Use the consolidated MQD manager functions for GFX11

Wenjing Liu (3):
      drm/amd/display: rework recent update PHY state commit
      drm/amd/display: support proper mst payload removal when link is not in mst mode in dc
      drm/amd/display: solve regression in update phy state refactor

Yang Li (6):
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings

YiPeng Chai (3):
      drm/amdgpu: Adjust removal control flow for smu v13_0_2
      drm/amdgpu: Fixed psp fence and memory issues when removing amdgpu device
      drm/amd/pm: Remove redundant check condition

Yifan Zhang (1):
      drm/amdgpu: add MES and MES-KIQ version in debugfs

Yury Zhuravlev (1):
      drm/amdgpu: getting fan speed pwm for vega10 properly

hongao (1):
      drm/amdgpu: fix initial connector audio value

muansari (1):
      drm/amd/display: Modify DML to adjust Vstartup Position

ye xingchen (2):
      drm/amd/pm: Remove the unneeded result variable
      drm/amd/pm: Remove unneeded result variable

zhikzhai (1):
      drm/amd/display: skip audio setup when audio stream is enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 607 ++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  70 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  48 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          | 168 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 100 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  42 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  85 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  63 ++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  11 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  14 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  36 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  19 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  98 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 119 +---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  39 ++
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  25 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  12 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   7 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 170 +++++-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |  20 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   9 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   | 220 --------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  44 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   4 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |   3 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |   4 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  21 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   4 +
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |   4 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |   2 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  11 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   4 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |  70 ++-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |  19 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   2 -
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   5 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  11 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |  14 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |  29 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 100 +++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  | 103 ++--
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  11 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 153 +++++-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |  52 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   3 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |   5 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  24 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   7 +
 .../display/dc/dml/dcn314/display_mode_vba_314.c   | 424 ++++----------
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 172 +++++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |  16 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   2 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  26 +
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   1 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |  16 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |  23 +-
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |   6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   6 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |   4 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |   2 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |   2 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |   2 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |   8 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   3 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   1 +
 .../drm/amd/display/include/ddc_service_types.h    |   4 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   3 -
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |  25 +-
 .../pm/powerplay/hwmgr/vega12_processpptables.c    |   5 +-
 .../drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  46 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  53 +-
 include/uapi/drm/amdgpu_drm.h                      |   8 +
 115 files changed, 2219 insertions(+), 1658 deletions(-)
