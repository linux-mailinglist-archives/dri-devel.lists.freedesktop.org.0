Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA67638F81
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 19:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1839310E787;
	Fri, 25 Nov 2022 18:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0948B10E786;
 Fri, 25 Nov 2022 18:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKSVUYDJG7ioYSG3K+0sHDONGVXrSBVZ5f65vjY2iaaR2HfPyCe9qOqYMxS07vWUI7kuGqwoBuSSeztdG9idxalAkT6ikDGyEQ5ctLXwtIJfT3QAVaM/YHJ2h0na6wkPIDFRYwgX7/N0Ivzqdtg9p5bXg8B+fEegB9ynfz0qt6EcQKha5Lmbra2ysXWYUACcUsdbn40yOCRK9oA5RdWaWIo8WKUBv0mIZ7NfgpBy5INKBJBQ0b1fjbVazIFN6F20wN2CGSYPoXGHt52frkujPRMbNXtz28KFzFyiUBRfSpgcTxkMgVBaxIlP/qDc6/DkJq91hhZesnri1Fj49bs2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRzcqVB1j2/b7e/WY+nyVDpc43iyx4lCZWKYo3RBWF4=;
 b=DmIqWnd1eQ3S2nGSIddTRvjSewAGIPDeDgMxH7ul3pLhpLXhKuQUfHLEnBXl6HWPvG7rAzwtObQo62yvkZZnblX6xfzZIINc7ousrN2QutzmjWdyKv+JF2p/058hwIKlux3mIrbBCKo/CuGLsmWz8z0i5AcnCo7Rc/j7sabgAcN5Bt4CDx+0ATUquqVNOnKPCuliqpNsOnUxtrXiMgW8OHNTuJ2Y3OZE/ppd70SpNBwDgpvbJzvqFGCZMvXYeaJppwTv6qDYunz/Z64+tLVeHnwCqvgcpItxaiqZIHELTS7XWpYFG6xUNCbdKA+cy8AcBQIIN7Kx92v9Atwt1ZajbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRzcqVB1j2/b7e/WY+nyVDpc43iyx4lCZWKYo3RBWF4=;
 b=MQfbEb6ISvWtcrrI8wxfFiXwVJt7ZOBF18s9DpLWFVrczB7uQ6C99lOLy4Lfl3AAlFQqZIwboi6kUTnyj7L6J4JwBcavaespu7a8KUchzREPg8TJF/VcwoUSl30lNKrw4sIJn/rc9z1AiLebAYojLn8zn6v8v0M1DEe19+LHDPU=
Received: from CY5PR22CA0072.namprd22.prod.outlook.com (2603:10b6:930:80::17)
 by BY5PR12MB4869.namprd12.prod.outlook.com (2603:10b6:a03:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 18:05:35 +0000
Received: from CY4PEPF0000C96D.namprd02.prod.outlook.com
 (2603:10b6:930:80:cafe::25) by CY5PR22CA0072.outlook.office365.com
 (2603:10b6:930:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Fri, 25 Nov 2022 18:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96D.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Fri, 25 Nov 2022 18:05:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 25 Nov
 2022 12:05:33 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.2
Date: Fri, 25 Nov 2022 13:05:19 -0500
Message-ID: <20221125180519.6389-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96D:EE_|BY5PR12MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: b87e4ead-2340-4ca6-21a7-08dacf0fa67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSD2PklN9zbxZYIh8ugfvoPr1XcO/0BBSbyUCuYEF87ZJ5tztIQK0qTWKn3ZkJ+J76PgSYPuu0ZrJqlIPoVWV9X5tk24awYZrEcYuMs2FU5MfY0Xgpky5NlRksD1BJIhuZAl158/hOpsf2ORmrIbK9e0wpRSJ6vPYLrF3LQ5SKtEx18zlBLOzXRe1fgQpY5HkZ//1OlhyB2HnA1XYPZGM3rD2O6QqMGLgOPol810313RRwsvxjfPvNvlDkQ2+R5yNVe9x9RH39so2yJTrY3t8xEKy4E5Ll7NQ6Kk80VMynjGctYZ/NoYbb3uW6jp+9rzpa84HjkWWhnJ7j3VVCwSeEa6oZncSWCKg0nX7V0YzKdzIOXv0t/6C6gmcmUwkbTJ8wtHvwIRYrxe3N4HTlcu/eUxbwS5dZoeHW/QJR99RI+9rA2niNjE4olQ/HU76qU8ecdj/By4k8uO6+I2D1Vn8KQIY/weE9ZeMDcEXe1VRMQ0gXIE/NEWBzQVCP9VD0OJqkiIIgSEKJ6uyeVWg1USLGlY6qwNk6oQ4H4ppaalsaPKRLu7EMpUoOyHh1n+wKDbDtuQ0zgnx131N9fNBLRE6OWPpwK0hUmqHu/vKvjuRKqklVE5y2R739YGNR+XgAUx1plwasq8DAvgxGriYKuRGGPNHglYwxBAM5Zd1FM9D9BAeoUp6eiwih8a7ZveP/h8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(336012)(1076003)(426003)(47076005)(186003)(16526019)(26005)(7696005)(966005)(4001150100001)(478600001)(5660300002)(70586007)(70206006)(6666004)(82310400005)(36756003)(2906002)(82740400003)(36860700001)(83380400001)(316002)(86362001)(2616005)(4326008)(8936002)(40460700003)(41300700001)(8676002)(81166007)(40480700001)(356005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 18:05:34.9733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87e4ead-2340-4ca6-21a7-08dacf0fa67a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4869
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

More stuff for 6.2.  Mostly bug fixes at this point.

The following changes since commit 3d335a523b938a445a674be24d1dd5c7a4c86fb6:

  Merge tag 'drm-intel-next-2022-11-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-11-23 09:15:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-2022-11-25

for you to fetch changes up to 10d2d1fc05f03ee1626b60761a3425622767513e:

  drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read" (2022-11-23 10:31:31 -0500)

----------------------------------------------------------------
amd-drm-next-6.2-2022-11-25:

amdgpu:
- Old GCC fix
- GFX11 fixes
- PSP suspend/resume fix
- PCI ref count fix
- DC KASAN fix
- DCN 3.2.x fixes
- Dell platform suspend/resume fixes
- DCN 3.1.4 fixes
- RAS fixes
- SMU 13.x fixes
- Flex array changes
- VCN 4.0 RAS updates
- Add missing licsense to some files
- Documentation updates
- SR-IOV fixes
- DP MST DSC fix

amdkfd:
- Fix topology locking in error case

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/psp: don't free PSP buffers on suspend
      Revert "drm/amd/display: fix dpms_off issue when disabling bios mode"
      drm/amdgpu: add missing license to some files
      drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read"

Alvin Lee (6):
      drm/amd/display: Add margin on DRR vblank start for subvp
      drm/amd/display: Limit HW cursor size of >= 4k
      drm/amd/display: Check if PSR enabled when entering MALL
      drm/amd/display: Add debug options for increasing phantom lines
      drm/amd/display: Retain phantom plane/stream if validation fails
      drm/amd/display: Revert check for phantom BPP

Aric Cyr (1):
      drm/amd/display: 3.2.213

Aurabindo Pillai (1):
      drm/amd/display: trigger timing sync only if TG is running

Bob zhou (1):
      drm/amd/display: fix compilation issue with legacy gcc

Camille Cho (1):
      drm/amd/display: new ABM config 2

Candice Li (1):
      drm/amd/pm: Enable bad memory page/channel recording support for smu v13_0_0

David Galiffi (1):
      drm/amd/display: Fix rotated cursor offset calculation

Dillon Varone (5):
      drm/amd/display: Update soc bounding box for dcn32/dcn321
      drm/amd/display: Use dummy pstate latency for subvp when needed on dcn32
      drm/amd/display: Add check for DET fetch latency hiding for dcn32
      drm/amd/display: Use viewport height for subvp mall allocation size
      drm/amd/display: Use new num clk levels struct for max mclk index

Felix Kuehling (1):
      drm/amdkfd: Release the topology_lock in error case

Ilya Bakoulin (1):
      drm/amd/display: Fix display corruption w/ VSR enable

Jack Xiao (1):
      drm/amd/amdgpu: reserve vm invalidation engine for firmware

Jane Jian (1):
      drm/amdgpu/vcn: re-use original vcn0 doorbell value

Luben Tuikov (1):
      drm/amdgpu: Fix minmax warning

Lyude Paul (2):
      drm/amdgpu/dm/mst: Fix uninitialized var in pre_compute_mst_dsc_configs_for_state()
      drm/amd/dc/dce120: Fix audio register mapping, stop triggering KASAN

Mustapha Ghaddar (1):
      drm/amd/display: Phase 1 Add Bw Allocation source and header files

Nicholas Kazlauskas (2):
      drm/amd/display: Update Z8 watermarks for DCN314
      drm/amd/display: Add Z8 allow states to z-state support list

Paulo Miguel Almeida (1):
      drm/amdgpu: Replace remaining 1-element array with flex-array

Ren Zhijie (1):
      drm/amdgpu: fix unused-function error

Rodrigo Siqueira (1):
      drm/amd/display: Add YCBCR2020 coefficients to CSC matrix

Shikang Fan (1):
      drm/amdgpu: fix for suspend/resume kiq fence fallback under sriov

Stanley.Yang (1):
      drm/amdgpu: fix use-after-free during gpu recovery

Taimur Hassan (1):
      drm/amd/display: Avoid setting pixel rate divider to N/A

Tao Zhou (2):
      drm/amdgpu: add register definition for VCN RAS initialization
      drm/amdgpu: enable RAS poison for VCN 2.6

Tsung-hua Lin (1):
      drm/amd/display: No display after resume from WB/CB

Yang Yingliang (1):
      drm/amdgpu: fix pci device refcount leak

ZhenGuo Yin (1):
      drm/amdgpu: update documentation of parameter amdgpu_gtt_size

lyndonli (2):
      drm/amd/pm: update driver if header for smu_13_0_7
      drm/amdgpu: add the fan abnormal detection feature

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  27 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  16 +--
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  29 +++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          | 120 +++++++++++----------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  37 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   2 +-
 .../dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h       |   1 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   4 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |  12 ++-
 .../dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h       |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  33 +++++-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  16 ++-
 drivers/gpu/drm/amd/display/dc/dc.h                |   6 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  14 +++
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   9 +-
 .../drm/amd/display/dc/dce120/dce120_resource.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |  34 ++++--
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |  28 +++--
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   6 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  32 ++++--
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   7 ++
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  11 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  27 ++++-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   3 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  12 ++-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  75 ++++++++++---
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  41 ++++++-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  69 ++++++++++++
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |  18 ++++
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   8 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   9 +-
 .../gpu/drm/amd/display/dc/link/link_dp_dpia_bw.c  |  28 +++++
 .../gpu/drm/amd/display/dc/link/link_dp_dpia_bw.h  |  69 ++++++++++++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   3 +-
 .../drm/amd/display/modules/power/power_helpers.c  |   9 ++
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |   1 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |   1 +
 .../drm/amd/include/asic_reg/vcn/vcn_2_5_offset.h  |   3 +-
 .../drm/amd/include/asic_reg/vcn/vcn_2_5_sh_mask.h |  27 +++++
 drivers/gpu/drm/amd/include/atombios.h             |   2 +-
 drivers/gpu/drm/amd/include/yellow_carp_offset.h   |   1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h | 117 +++++++++++++-------
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  31 ++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  39 +++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   1 +
 65 files changed, 896 insertions(+), 216 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia_bw.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia_bw.h
