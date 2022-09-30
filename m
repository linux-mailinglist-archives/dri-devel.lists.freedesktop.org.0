Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDAC5F0FC5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 18:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FD410ED7D;
	Fri, 30 Sep 2022 16:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FF510ED7D;
 Fri, 30 Sep 2022 16:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wgs0sAYuahO26gfxTTSD3zUBFd3d+7LgP8OaoXzqtcdecbp5y2y2uj5iI/vV4ScY2zRLYPFLUyJRqdXtN/KgIH/eQak45DYFEbpLtMPzTYo3hIWMpOv2kEQGgfWuETDHpiVJXQ9fx7wjYR2WK83FJdbtzuAGWb1QQkllIk3M7PwYafKsa8F6QpgQ/m0vVqCiiFSLxSEnXq/RXm6UjMYAhJcswd24mNFn3NK0mI1ZIU31NG32PYudR5MEyCh9MXdwGKAK+DgoZqa/Pg8KeUPaCbF5prDTGzWVPqol2qunQvmFr+1z1s+fBJAKvUBNPIbSPTdbQoXEB3a/UCLMLF9Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h2aiqvKAxEOeRIK76awACMPaRMs9yrJVq0ZQVkS46k=;
 b=CxjcvfXr2OHlhQO0gY9wcQY89jTNGVYGb0LIYSqL6KUPX6/usdWeFUgnaGn9eCIq4sLKvKyYVLf9RgAcHdeOvay7va+w4AH3jnju4nFVPUQOtQXOFk6xwZLUozVMuI8gAcgxgkNvoFIMhV3DET9xcQnGXswUWR8kYv0t055+J1pc6ExwkNmAKcImD06ykWi+vDKAUrylPbzXELGt+3CV2u/mqQ2oyi4pfQWuVD+wolfYbmxbFfRRwAWX0Cg9CmkJRgxuuNSl67ey+cohOYqvo7sIrf1+mfwMWRwzRQTS28oa3xsYRwXFU89o9KmkD7OMQDosJoBjy+bIBpzpR9SUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h2aiqvKAxEOeRIK76awACMPaRMs9yrJVq0ZQVkS46k=;
 b=KoxUMTLosnVrZdsYBImxnPV3m8v7ackrINe7VI+mFV4SkLxqWov2DV5Bn3+XlJVpvbcGdRKY1X9iFEe1paNmW6BIlZjl3OsVfCl6EXJSDWbRWPZLX70oZqDGQp0ciTMR3f9wt6gPM9qnprJbz1M1b6ZdPDBFZtq+OL58mcnD4rQ=
Received: from DS7PR07CA0005.namprd07.prod.outlook.com (2603:10b6:5:3af::15)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Fri, 30 Sep
 2022 16:20:26 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::dd) by DS7PR07CA0005.outlook.office365.com
 (2603:10b6:5:3af::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 16:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 16:20:25 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 11:20:24 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.1
Date: Fri, 30 Sep 2022 12:20:12 -0400
Message-ID: <20220930162012.5823-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: abcbc53b-0b45-4339-44a0-08daa2ffaf23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1C1HAmeK3cYGTPScSBFfmkN122htX1FjNwJU5JYMoCj7fJG/EOm2+LTveWKvGTLSE4deBGGEgGp0dr0hcXGwRAkOBlBunxnWmhoAAlIFOfZY6PyF6yu0GT7EBDai7giftSrn3hTfgVWCPWcl+oU4xfIyJfRauEy0b9Bxzl7Asuf6G6vx1V6WXJge4XQgRidlrtfyp+kmld7FEyFe5U9nn1WrNGCBhGUfEaBAUVgydTp9NkD9Csp/k72Z09nuCzGrsXmoXJzgeVKcKXNF/1QLcJyrn3Np4dZyGQBMD6Qdws/NzoqQr5Ubn1bOMKxHIympNt0z6wzF4AI7DWcLS48oR5xO8UYRazMrnDeoqKKEHAywQqsBiSBMPxDu2z+BqUdN/HX9ulYvJTY0CGpExcqCTmd7u0++kil7D9PX3lhgiP4pgPjxNSxmM2bNmhctiBg1S0hRltfy3r7MQAb0g7iqUudJvv82hhqsOAoWW5iDTxQHLP1xEr0JUv1MCFmgskf60RcwVgacm547Tw+chAbTuWxzSXy3Fl1lEP3cW/TP3ogMAdEbMoXMu9VPexDr3rd8Sf8u8asu6SgmAtrbfrdFu15YgTShaxtEAyHhuhttvTq54o9pxPnpMUA6hnuge0M5XUk97LdgmZpq3ZngI6GGgOlKDRyhfI5R8ovokrRRjaV6B798RqnLjsj/Lbwn7E7ITI7Wfd69noRg9fA8t4KQXdyXc736PCrf0FgtcjfB9TWwNPwAeSDyVEfe0zxrvz9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(356005)(41300700001)(426003)(5660300002)(40480700001)(8936002)(47076005)(70586007)(70206006)(30864003)(86362001)(186003)(2906002)(36756003)(1076003)(16526019)(336012)(966005)(26005)(478600001)(81166007)(8676002)(40460700003)(83380400001)(82310400005)(36860700001)(7696005)(316002)(82740400003)(6666004)(110136005)(2616005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 16:20:25.9718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abcbc53b-0b45-4339-44a0-08daa2ffaf23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
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

A few fixes for 6.1.

The following changes since commit 3e43b760c9e14fc0b7bd553efb01d9ca825cf338:

  drm/amdgpu: Fix amdgpu_vm_pt_free warning (2022-09-21 15:25:52 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.1-2022-09-30

for you to fetch changes up to b292cafe2dd02d96a07147e4b160927e8399d5cc:

  drm/amdkfd: Fix UBSAN shift-out-of-bounds warning (2022-09-30 11:21:25 -0400)

----------------------------------------------------------------
amd-drm-next-6.1-2022-09-30:

amdgpu:
- RLC FW code cleanup
- RLC fixes for GC 11.x
- SMU 13.x fixes
- CP FW code cleanup
- SDMA FW code cleanup
- GC 11.x fixes
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- Misc fixes
- RAS fixes
- SR-IOV fixes
- VCN 4.x fixes

amdkfd:
- GC 11.x fixes
- Xnack fixes
- UBSAN warning fix

----------------------------------------------------------------
Alvin Lee (5):
      drm/amd/display: Update DCN32 to use new SR latencies
      drm/amd/display: Disable MALL when TMZ surface
      drm/amd/display: Update MALL SS NumWays calculation
      drm/amd/display: Fix CAB allocation calculation
      drm/amd/display: Only use ODM2:1 policy for high pixel rate displays

Aric Cyr (3):
      drm/amd/display: Remove interface for periodic interrupt 1
      drm/amd/display: Fix audio on display after unplugging another
      drm/amd/display: 3.2.205

Asher Song (1):
      drm/amdgpu: fix a compiling error in old kernels

Aurabindo Pillai (3):
      drm/amd/display: skip phantom pipes when checking for pending flip
      drm/amd/display: skip phantom pipes when checking for pending flip
      drm/amd/display: fix a divide by zero error

Bokun Zhang (1):
      drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV

Brandon Syu (1):
      drm/amd/display: Add debug option for exiting idle optimizations on cursor updates

Charlene Liu (1):
      drm/amd/display: add debug keys for override bios settings.

David Belanger (1):
      drm/amdgpu: Enable SA software trap.

Dillon Varone (1):
      drm/amd/display: Fix various dynamic ODM transitions on DCN32

Eric Bernstein (1):
      drm/amd/display: Remove assert for odm transition case

Evan Quan (3):
      drm/amdgpu: avoid gfx register accessing during gfxoff
      drm/amd/pm: enable gfxoff feature for SMU 13.0.0
      drm/amd/pm: use adverse selection for dpm features unsupported by driver

Felix Kuehling (1):
      drm/amdkfd: Fix UBSAN shift-out-of-bounds warning

Graham Sider (4):
      drm/amdkfd: fix MQD init for GFX11 in init_mqd
      drm/amdgpu: pass queue size and is_aql_queue to MES
      drm/amdkfd: fix dropped interrupt in kfd_int_process_v11
      drm/amdgpu: remove switch from amdgpu_gmc_noretry_set

Hamza Mahfooz (1):
      drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()

Hawking Zhang (10):
      drm/amdgpu: add helper to init rlc fw in header v2_0
      drm/amdgpu: add helper to init rlc fw in header v2_1
      drm/amdgpu: add helper to init rlc fw in header v2_2
      drm/amdgpu: add helper to init rlc fw in header v2_3
      drm/amdgpu: add helper to init rlc fw in header v2_4
      drm/amdgpu: add helper to init rlc firmware
      drm/amdgpu/gfx9: switch to amdgpu_gfx_rlc_init_microcode
      drm/amdgpu/gfx10: switch to amdgpu_gfx_rlc_init_microcode
      drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode
      drm/amdgpu: add rlc_sr_cntl_list to firmware array

Ian Chen (1):
      drm/amd/display: Add ABM control to panel_config struct.

Ilya Bakoulin (1):
      drm/amd/display: Change EDID fallback condition

Jiadong.Zhu (2):
      drm/amdgpu: Correct the position in patch_cond_exec
      drm/amdgpu: Remove fence_process in count_emitted

Le Ma (1):
      drm/amdgpu: correct the memcpy size for ip discovery firmware

Leo Li (2):
      drm/amd/display: Prevent OTG shutdown during PSR SU
      drm/amdgpu: Fix mc_umc_status used uninitialized warning

Li Zhong (1):
      drivers/amd/pm: check the return value of amdgpu_bo_kmap

Lijo Lazar (2):
      drm/amdgpu: Disable verbose for p2p dist calc
      drm/amdgpu: Use simplified API for p2p dist calc

Likun Gao (11):
      drm/amdgpu: add function to init CP microcode
      drm/amdgpu/gfx9: use common function to init cp fw
      drm/amdgpu/gfx10: use common function to init CP fw
      drm/amdgpu/gfx11: use common function to init cp fw
      drm/amdgpu: add function to init SDMA microcode
      drm/amdgpu/sdma4: use common function to init sdma fw
      drm/amdgpu/sdma5: use common function to init sdma fw
      drm/amdgpu: support sdma struct v2 fw init
      drm/amdgpu/sdma6: use common function to init sdma fw
      drm/amdgpu: fix compiler warning for amdgpu_gfx_cp_init_microcode
      drm/amdgpu: fix sdma v4 init microcode error

Max Tseng (1):
      drm/amd/display: Cursor Info Update refactor

Michael Strauss (1):
      drm/amd/display: Refactor LTTPR mode selection

Nicholas Kazlauskas (3):
      drm/amd/display: Do DIO FIFO enable after DP video stream enable
      drm/amd/display: Wrap OTG disable workaround with FIFO control
      drm/amd/display: Add explicit FIFO disable for DP blank

Philip Yang (1):
      drm/amdkfd: Track unified memory when switching xnack mode

Ruijing Dong (1):
      drm/amdgpu/vcn: update vcn4 fw shared data structure

Samson Tam (1):
      drm/amd/display: fill in clock values when DPM is not enabled

Sonny Jiang (2):
      drm/amdgpu: Enable VCN DPG for GC11_0_1
      drm/amdgpu: Enable sram on vcn_4_0_2

Taimur Hassan (3):
      drm/amd/display: Avoid avoid unnecessary pixel rate divider programming
      drm/amd/display: Fix typo in get_pixel_rate_div
      drm/amd/display: Avoid unnecessary pixel rate divider programming

Tao Zhou (4):
      drm/amdgpu: export umc error address convert interface
      drm/amdgpu: support to convert dedicated umc mca address
      drm/amdgpu: use RAS error address convert api in mca notifier
      drm/amdgpu: add page retirement handling for CPU RAS

Tom St Denis (1):
      drm/amd/amdgpu: Add missing XGMI hive registers for mmhub 9.4.1

Vignesh Chander (1):
      drm/amdgpu: Skip put_reset_domain if it doesn't exist

Wenjing Liu (2):
      drm/amd/display: add missing null check
      drm/amd/display: polling vid stream status in hpo dp blank

YiPeng Chai (1):
      drm/amdgpu: Fixed ras warning when uninstalling amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 140 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            | 272 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           | 133 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 282 +-------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 315 +--------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 206 +-----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             | 105 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  49 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  69 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  73 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  58 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   4 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 771 +++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  21 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  26 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  60 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  21 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  11 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  14 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 133 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |  18 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 301 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |  33 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   8 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   7 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   6 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  35 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |   3 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   3 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   1 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   3 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   6 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |  47 ++
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |  25 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |  53 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 282 ++++----
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   8 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  28 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   1 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  72 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   5 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   9 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   5 +
 .../drm/amd/display/include/link_service_types.h   |   1 +
 .../include/asic_reg/mmhub/mmhub_9_4_1_offset.h    |   4 +
 .../include/asic_reg/mmhub/mmhub_9_4_1_sh_mask.h   |   8 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   3 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  89 +--
 82 files changed, 2116 insertions(+), 1987 deletions(-)
