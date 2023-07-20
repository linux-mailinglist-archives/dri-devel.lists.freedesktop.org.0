Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8F75B026
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCE810E5C5;
	Thu, 20 Jul 2023 13:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B177891D1;
 Thu, 20 Jul 2023 13:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuHjlEQdF1EVL2T2bDEaZ+zgrjTZXHIpJHDxeAmT2KvPPZLXfeL/fraK4GATnr6peXaIWG3p7vFHPddrtYQWhAsUmnac2IpxE3lxvshRF709kb4C6PhCk6NZKSlXrqDOG9D4eXxR7BaiE5/A90LP8x4EFVcd3bCofRCnTJMFyPrp5Hd0kTHhVY0uOmErXbIfJN1eSKnqLbsubvfMFnB8Jd8AdQFU14XnvisIAD31rYcSU/JpUnRXngA3yNdKy8GAooolRD5Qnu2VxPxSd7/nXKPpF1eHkQyRgDclZrWHRYLpQRL5MP5ZFJ8T5zqw9L4F15YXZb6Tv1bpl5hFDwcmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVAF2B+wRbpbpVtkbMTT9yovzT0NrxYoJf1rJv7PSLI=;
 b=NauMHLPbcHYTWcZFJd0K/7xjsB9SazqPK4NBUXpB6ItBX+AXr6ytZo8DSzzpxxB78OBkrYXuseDiEPRwsv3hPpJb4XyHkIJK1WD7SgBpnAaLM7trtkAxYbw5wpX5f9Ohxlo9iwt9brEt6tpFDOMdkoOWylPpweGFDDOoinJDVzPM2Kt0LG1XCfSXm+m3+skMr22PNnTkbAs3MIU63BsFdTn63cYPLBiBfOLAzA6Rj2ePO7Gh0vz3Dgb6SnLn7nt81Yy0O7zOh42KkcDlwEtrYjNRdM9/I4Rk9AXL4dWh9dAfVwnV2hK4oVr/SZNPZpL3+3QudtCpsU+TpL8CgCgtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVAF2B+wRbpbpVtkbMTT9yovzT0NrxYoJf1rJv7PSLI=;
 b=b51qClOH9K62rCCrMUEyZm0mNyQtBSdxr9Wcf91GF+orS8KIW9fvHwyrmvlHc5vIj7aMvHwMqd7We+kVBTMMUChcwZ3PEozOfluXnS1UYkfNRNqJIAzzSPgaaKffXk0xiE7eeSDDCGPabwsSphmrrYNGpLM48gB935iu+qtMyhI=
Received: from DS7PR03CA0133.namprd03.prod.outlook.com (2603:10b6:5:3b4::18)
 by MW3PR12MB4586.namprd12.prod.outlook.com (2603:10b6:303:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 13:35:15 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::1a) by DS7PR03CA0133.outlook.office365.com
 (2603:10b6:5:3b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Thu, 20 Jul 2023 13:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.44 via Frontend Transport; Thu, 20 Jul 2023 13:35:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 08:35:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.5
Date: Thu, 20 Jul 2023 09:34:56 -0400
Message-ID: <20230720133456.7826-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT035:EE_|MW3PR12MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 613c8eb5-9bb3-42af-7280-08db89262699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ja30m0JubXhJfPrPTnzYGJuCIEwx4+n8KAPWc0TfAYhtc13u4oDPaYykkHiPhFsaTItPKnyW+2LcgLWjP09eZyH2PXfm+8tYkabrQ7yBniIVRzbQ8g1TKXYxd1llMKxrSzISJzu2h8EiCGSCj91HLkGQ9ST5/HU0BHnYlJFjHisUrCrrz4fEDFS5PLFiiW++xRFihLKGWlxtnF9ppAimCQq9FxCsafccWiBpt1tsJQRXtxvDRAkzzPHv8f9n67dtfNGmCTJS5LZ1xs0Zgt8SGv8G9hGHlsau9ARQH3nWhB41I/mdRriljtNfyXb4YKx7wQWzw7gXTXnJJS7whlaXIMacwHNCmf/AHZynjHU7dpJ25nYtd9GIqPURSMXhcKpJnn+9xjl78v5b/WCFQIXAcMWk1+jSFC78DWX8v+EXdEcbkNePkN1JF27UijLn+zdWYszD6WpYT3N0tgaliklErYcqPOZIk7XNklJvXe0SiGasqV9SgsUwkcTQYTn494XNg1FFKQe0YgOpsTr6QfxjxNgJ7LUU180uUFvZ4Vc16qmzZGl4U347WJnDp44JkNPvfmWBLJNqDsALDTgmh8Ns70Q4hVsafptxQlAptUH6aqG8ToV9N9XrJd9D5Wy/VI9tjZlYPkADIRiTCMFc0b+zS9lvdqOLbnG4pqWKyGe8PNacoSft4D0E35iVLt4uW3sy8OuitYrn9cye9Nna0DmtddO86mGgylWBm8lrWF++N5P2tLBDknhnmMtZ4YcITfR4ARNCYz5nSlVjtgp9Kdt4ZQCklXDA1eZRNNQQ4mb0kO84im+WXve67QMNo3V4h+rh
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(70586007)(40460700003)(110136005)(478600001)(47076005)(336012)(1076003)(2616005)(426003)(36860700001)(86362001)(26005)(186003)(16526019)(81166007)(82740400003)(83380400001)(356005)(2906002)(7696005)(6666004)(966005)(8936002)(8676002)(4326008)(41300700001)(40480700001)(5660300002)(316002)(36756003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 13:35:15.1629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 613c8eb5-9bb3-42af-7280-08db89262699
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4586
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

Fixes for 6.5.

The following changes since commit fdf0eaf11452d72945af31804e2a1048ee1b574c:

  Linux 6.5-rc2 (2023-07-16 15:10:37 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.5-2023-07-20

for you to fetch changes up to b13d3e9c6b62597a5c31fdc74febb3bc588893bf:

  drm/amdgpu: use a macro to define no xcp partition case (2023-07-18 14:42:54 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.5-2023-07-20:

amdgpu:
- More PCIe DPM fixes for Intel platforms
- DCN3.0.1 fixes
- Virtual display timer fix
- Async flip fix
- SMU13 clock reporting fixes
- Add missing PSP firmware declaration
- DP MST fix
- DCN3.1.x fixes
- Slab out of bounds fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/pm: make gfxclock consistent for sienna cichlid
      drm/amdgpu/pm: make mclk consistent for smu 13.0.7

Aurabindo Pillai (2):
      drm/amd/display: export some optc function for reuse
      drm/amd/display: add DCN301 specific logic for OTG programming

Candice Li (1):
      drm/amdgpu: Allow the initramfs generator to include psp_13_0_6_ta

Daniel Miess (1):
      drm/amd/display: Prevent vtotal from being set to 0

Guchun Chen (5):
      drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
      drm/amdgpu: Allocate root PD on correct partition
      drm/amdgpu: fix slab-out-of-bounds issue in amdgpu_vm_pt_create
      drm/amdgpu/vm: use the same xcp_id from root PD
      drm/amdgpu: use a macro to define no xcp partition case

Mario Limonciello (1):
      drm/amd: Use amdgpu_device_pcie_dynamic_switching_supported() for SMU7

Nicholas Kazlauskas (1):
      drm/amd/display: Keep PHY active for DP displays on DCN31

Simon Ser (1):
      drm/amd/display: only accept async flips for fast updates

Srinivasan Shanmugam (1):
      drm/amd/display: Clean up errors & warnings in amdgpu_dm.c

Taimur Hassan (1):
      drm/amd/display: check TG is non-null before checking if enabled

Wayne Lin (1):
      drm/amd/display: Add polling method to handle MST reply packet

Zhikai Zhai (1):
      drm/amd/display: Disable MPC split by default on special asic

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   2 +
 .../gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 256 +++++++++------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  12 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 110 +++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  11 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   5 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |   3 +
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   3 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_optc.c    | 185 +++++++++++++++
 .../gpu/drm/amd/display/dc/dcn301/dcn301_optc.h    |  36 +++
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   4 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  14 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   2 +-
 29 files changed, 524 insertions(+), 196 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_optc.h
