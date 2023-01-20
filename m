Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6B6761B9
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F03910EB26;
	Fri, 20 Jan 2023 23:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7854C10EB20;
 Fri, 20 Jan 2023 23:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGXe3uhxRbGEmW5FWf1XQ4eUIZ0sh/O4JHXsYm/dlbDGxEJsy+OVox80Jb4DyPD8RDp6gJ4ZtUXs6/85fXERvhgWn3gCBJMHyk1kOH7dMNFCsqQMXfAt4H1Y2dt77OLmwzXGSd94H4e8GhfVFoBS+kzrzgoRQSTnA+pctQ2JGrMob70odKDxMV6oZhkUyb92RtQOFFxD8VSyyVMWNcvAgYBDPJ8mfX4v1lHcKmg7Z0HyyziGQCmIy96ZMy6W0zclykgmeFfq2QvB3HryYyHIl1s7B1ZAdb4vhFNzA3mSdlUyCc5CR7y5cDkm8i0sK9bRWBH2qGcTQ13yVWZGtgXpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G15Ud2vpctsJ7BiJwz6kSOUKyJDzKtcKdRr6STUB1R0=;
 b=hDfBvSBrPHpSJrRq/LDPABHD+sTsB7ntMHWhQDCnmkW4vaMhET41VxN+S7b8Vn6yPQrflRiPJtEUtg3modsPv+hnSPKxNxi2dHITNBKZ4qYfys1oiNP4BvoemXTvMBiWtPTi7s7vZh18BRpmKBxiZ54/d3CsTgXH/U2sS2yFuHoP9qMyRh7cKQStoNOiNM7m4Gy5L5VIN3xWkK4q2mhB6wEfIXNYrlmCfpSPahWfa7aDKB85S19VPwwwrEW5ED61rcFswFM9lul8BECEQmYnWuSTeMTG3j9QLn3arBdei/e84kkKxpMsdsFbEwYA+FOsssp62RhwaSLjrijWpXCO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G15Ud2vpctsJ7BiJwz6kSOUKyJDzKtcKdRr6STUB1R0=;
 b=q50GnoUpcJnUYKE4uJHQVsRwLZlycJ1p1oTCfqG7FhK4hIW2JBBJwbR1T6PvGqoi5qgWG5yLMg0qBGTd/ieiLlPkLeUlRU/EKO3e/uHp67w0wT/JFPslvTpQXsrCHQ+B0TD5LnpjuEiGajr7PAMj9PuQQAcAoT5CWJtF0LCNnkM=
Received: from CY5PR19CA0083.namprd19.prod.outlook.com (2603:10b6:930:69::21)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 23:45:39 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:69:cafe::ae) by CY5PR19CA0083.outlook.office365.com
 (2603:10b6:930:69::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 23:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C979.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 20 Jan 2023 23:45:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 17:45:37 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, UAPI drm-next-6.3
Date: Fri, 20 Jan 2023 18:45:23 -0500
Message-ID: <20230120234523.7610-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2276ad35-4b68-495e-d245-08dafb406f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27vP3LTCU1O0VX0wgrw/zdbrpMqIFmAS8GkeANpvLeUaYoI+PH/JSGSwBbEzcBn0D5uI8/z4uZ/nALgNVIla29FSkyXRwjqJ9a58/2HGmFsH7aNNQcp2oKnb0rxn3nVAsciYKRHnF1woCJ/lhkTkiOdUtJxOOZeojw6pCTrft+bueVrH1OETYpohkvqLI/KtfOOexUVm9XiloTf5KhJrtv6PKocOGm+S1IGRA5M/k7RfZIl+8jRavm7njyuTQO4jvur+Y5grd8aedjxQfK8cZ55vVU8JIXmRUVrOogtUsG9L7vMq6H/Ih9SRxcIS51XcKihgBOEfaV8YV8zMsS53JCBiD18PEOmBzKuCMWiDGiZswKFHOA4hXACpApX8B4WMvZ8bjnlar/e50xenOTeDgqzLr5IrjKT+iqmFwgKPpw/O1PLNAdVQVxzcsNzGIrusl39+kd66mMIfi1XTXYopJ6TtFOnJgUJliUmDzvNaSR91mICN56YhMKX4XwUx/cJEElYDT+y9XxxnzulOwviC25SNfvPLPt3fX8B/TSzoie89ARMXAj8wW/4UyX0S0Q08ZNM3MRFNbRYcJ8++U9CvbZ1ZyNPQIdf8f2zJdZFIRrkfCXSCG1FVxIBVO7HbsAFB5qc1xh1qS2ATJJvO3Rb9Q37nWrMoIJgNsB3mdvQ9cMkkmHVIXElwxoePNZMNFvBX9xD/cT7PkkHpCfoeOqMDPb9lckUvvxbPv7qyowN3JxMRFzMexgG1rc8n8wa4m28S
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(110136005)(26005)(966005)(2906002)(16526019)(186003)(316002)(2616005)(36756003)(478600001)(7696005)(6666004)(81166007)(86362001)(1076003)(356005)(40480700001)(40460700003)(82740400003)(66574015)(47076005)(426003)(336012)(36860700001)(83380400001)(41300700001)(4326008)(30864003)(5660300002)(8936002)(70206006)(70586007)(8676002)(82310400005)(36900700001)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 23:45:39.3387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2276ad35-4b68-495e-d245-08dafb406f8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

More updates for 6.3.

The following changes since commit 0c2dece8fb541ab07b68c3312a1065fa9c927a81:

  drm/amdkfd: Page aligned memory reserve size (2023-01-11 16:41:03 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.3-2023-01-20

for you to fetch changes up to b4a9b36e69e935104e52e561aa9a82d39b5efc36:

  Documentation/gpu: update dGPU asic info table (2023-01-19 17:24:26 -0500)

----------------------------------------------------------------
amd-drm-next-6.3-2023-01-20:

amdgpu:
- Secure display fixes
- Fix scaling
- Misc code cleanups
- Display BW alloc logic updates
- DCN 3.2 fixes
- Fix power reporting on certain firmwares for CZN/RN
- SR-IOV fixes
- Link training cleanup and code rework
- HDCP fixes
- Reserved VMID fix
- Documentation updates
- Colorspace fixes
- RAS updates
- GC11.0 fixes
- VCN instance harvesting fixes
- DCN 3.1.4/5 workarounds for S/G displays
- Add PCIe info to the INFO IOCTL

amdkfd:
- XNACK fix

UAPI:
- Add PCIe gen/lanes info to the amdgpu INFO IOCTL
  Nesa ultimately plans to use this to make decisions about buffer placement optimizations
  Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20790

----------------------------------------------------------------
Alex Deucher (8):
      drm/amdgpu/pm: update hwmon power documentation
      drm/amdgpu/nv: don't expose AV1 if VCN0 is harvested
      drm/amdgpu/vcn3: fail to schedule IB for AV1 if VCN0 is harvested
      drm/amdgpu/soc21: don't expose AV1 if VCN0 is harvested
      drm/amdgpu/vcn4: fail to schedule IB for AV1 if VCN0 is harvested
      drm/amd/display: disable S/G display on DCN 3.1.5
      drm/amd/display: disable S/G display on DCN 3.1.4
      Documentation/gpu: update dGPU asic info table

Alvin Lee (2):
      drm/amd/display: Request min clocks after disabling pipes on init
      drm/amd/display: Allow subvp on vactive pipes that are 2560x1440@60

Aric Cyr (1):
      drm/amd/display: 3.2.218

Arnd Bergmann (2):
      drm/amd/display: fix dp_retrieve_lttpr_cap() return value
      drm/amd/display: fix hdmi_encoded_link_bw definition

Aurabindo Pillai (2):
      Revert "drm/amd/display: Demote Error Level When ODM Transition Supported"
      drm/amd/display: fix an error check condition for synced pipes

Bhawanpreet Lakha (1):
      drm/amd/display: Change i2c speed for hdcp

Brandon Syu (1):
      drm/amd/display: fix mapping to non-allocated address

Candice Li (1):
      drm/amd/pm: Support RAS fatal error mode1 reset on smu v13_0_0 and v13_0_10

Charlene Liu (2):
      drm/amd/display: add hubbub_init related
      drm/amd/display: contional remove disable dig_fifo when blank

Christian König (2):
      drm/amdgpu: fix cleaning up reserved VMID on release
      drm/amdgpu: fix amdgpu_job_free_resources v2

Cruise Hung (1):
      drm/amd/display: Fix DPIA link encoder assignment issue

Dan Carpenter (1):
      drm/amdgpu: Add a missing tab

Deepak R Varma (5):
      drm/amd/display: Conversion to bool not necessary
      drm/amd/pm/powerplay/smumgr: use bitwise or for addition
      drm/amd/pm/powerplay/hwmgr: use bitwise or for bitmasks addition
      drm/amd/pm/powerplay/smumgr/ci: use bitwise or for bitmasks addition
      drm/amd/display: use swap() helper macro in bios_parser

Dillon Varone (9):
      drm/amd/display: Implement FIFO enable sequence on DCN32
      drm/amd/display: Optimize subvp and drr validation
      drm/amd/display: Account for DCC Meta pitch in DML MALL surface calculations
      drm/amd/display: Account for Subvp Phantoms in DML MALL surface calculations
      drm/amd/display: Use DML for MALL SS and Subvp allocation calculations
      drm/amd/display: cleanup function args in dml
      drm/amd/display: set active bit for desktop with VSDBv3
      drm/amd/display: Remove DISPCLK dentist programming for dcn32
      drm/amd/display: Account for MPO planes in dcn32 mall alloc calculations

Dmytro Laktyushkin (1):
      drm/amd/display: fix multi edp panel instancing

Guilherme G. Piccoli (2):
      drm/amdgpu/vcn: Adjust firmware names indentation
      drm/amdgpu/vcn: Remove redundant indirect SRAM HW model check

Hamza Mahfooz (2):
      drm/amd/display: fix possible buffer overflow relating to secure display
      drm/amd/display: fix issues with driver unload

Jiapeng Chong (1):
      drm/amd/display: Remove useless else if

Joshua Ashton (2):
      drm/amd/display: Calculate output_color_space after pixel encoding adjustment
      drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix

Konstantin Meskhidze (1):
      drm: amd: display: Fix memory leakage

Lang Yu (2):
      drm/amdgpu: correct MEC number for gfx11 APUs
      drm/amdgpu: allow multipipe policy on ASICs with one MEC

Leo Liu (1):
      drm/amdgpu: Use the sched from entity for amdgpu_cs trace

Marek Olšák (1):
      drm/amdgpu: return the PCIe gen and lanes from the INFO ioctl

Mario Limonciello (11):
      drm/amd: Avoid ASSERT for some message failures
      drm/amd: fix some dead code in `gfx_v9_0_init_cp_compute_microcode`
      drm/amd: Fix renoir/green sardine MP0 IP version detection
      drm/amd: Remove needless break for legacy IP discovery MP0 9.0.0
      drm/amd: Evaluate early init for all IP blocks even if one fails
      Documentation/gpu: Add MP0 version to apu-asic-info-table
      Documentation/gpu: Update lines for GREEN_SARDINE and YELLOW_CARP
      Documentation/gpu: Add Mendocino to apu-asic-info-table
      Documentation/gpu: Add Raphael to apu-asic-info-table
      drm/amd/display: Decrease messaging about DP alt mode state to debug
      drm/amd: decrease message about missing PSP runtime database to debug

Martin Leung (1):
      Revert "drm/amd/display: Speed up DML fast_validate path"

Mustapha Ghaddar (2):
      drm/amd/display: Update BW alloc after new DMUB logic
      drm/amd/display: Update dmub header to match DMUB

Philip Yang (1):
      drm/amdkfd: Support process XNACK mode dynamic change

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: print bo inode number instead of ptr

Rodrigo Siqueira (1):
      drm/amd/display: Remove unused code

Saaem Rizvi (2):
      drm/amd/display: Remove SubVp support if src/dst rect does not equal stream timing
      drm/amd/display: Add extra mblk for DCC

Stanley.Yang (2):
      drm/amdgpu: support check xgmi/walf error mask bit for aldebaran
      drm/amdgpu: correct query xgmi3x16 pcs error status

Tao Zhou (1):
      drm/amdgpu: retire unused get_umc_v6_7_channel_index

Thomas Zimmermann (1):
      drm/amdgpu: Fix coding style

Tony Tascioglu (2):
      drm/amd/display: Optimize link power-down when link powered externally
      drm/amd/display: Skip backlight control delay on external powered links

Wenjing Liu (7):
      drm/amd/display: refactor hpd logic from dc_link to link_hpd
      drm/amd/display: refactor ddc logic from dc_link_ddc to link_ddc
      drm/amd/display: move dpcd logic from dc_link_dpcd to link_dpcd
      drm/amd/display: move dc_link_dpia logic to link_dp_dpia
      drm/amd/display: move dp link training logic to link_dp_training
      drm/amd/display: move dp phy related logic to link_dp_phy
      drm/amd/display: move dp capability related logic to link_dp_capability

YiPeng Chai (10):
      drm/amdgpu: Add gfx ras function on gfx v11_0_3
      amd/amdgpu: Add RLC_RLCS_FED_STATUS_* to gc v11_0_3 ip headers
      drm/amdgpu: Add gfx ras poison consumption irq handling on gfx v11_0_3
      drm/amdgpu: Add gfx cp ecc error irq handling on gfx v11_0_3
      drm/amdgpu: Perform gpu reset after gfx finishes processing ras poison consumption on gfx_v11_0_3
      drm/amdgpu: Remove unnecessary ras block support check
      drm/amdgpu: Adjust ras support check condition for special asic
      drm/amdgpu: Optimize gfx ras block initialization code for gfx v9_0
      drm/amdgpu: Add sdma ras function on sdma v6_0_3
      drm/amdgpu: Optimize sdma ras block initialization code for sdma v4_0

Yifan Zha (1):
      drm/amdgpu: Skip specific mmhub and sdma registers accessing under sriov

hersen wu (2):
      drm/amd/display: phase2 enable mst hdcp multiple displays
      drm/amd/display: hdcp not enabled on connector 0

hongao (1):
      drm/amd/display: Fix set scaling doesn's work

jie1zhan (1):
      drm/amdgpu: Correct the power calcultion for Renior/Cezanne.

ye xingchen (1):
      drm/amd/display: remove duplicate included header files

 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |   18 +-
 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |    2 +
 Documentation/gpu/amdgpu/driver-misc.rst           |    2 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   47 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   35 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  119 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  166 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   95 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |   88 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.h           |   29 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   37 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |   34 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  101 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   21 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   34 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   61 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    7 -
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |    4 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   22 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  153 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |    5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    3 -
 drivers/gpu/drm/amd/display/dc/Makefile            |    6 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |    1 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   17 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   14 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.h   |    3 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |    3 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   97 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    6 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  544 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 6681 +++-----------------
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   60 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   35 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |   28 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    9 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |  114 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   69 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h       |    2 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    1 -
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   41 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |    2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   12 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    4 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    1 -
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   10 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.c  |    1 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    6 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    2 +-
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |    1 -
 .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |    1 -
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |    1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    1 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    6 +-
 .../display/dc/dcn301/dcn301_dio_link_encoder.c    |    1 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   16 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    6 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    1 -
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   18 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |   10 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    9 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    5 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    4 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    2 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    1 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |   30 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   29 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |   17 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  176 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |    6 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   15 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  183 +-
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |    1 -
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    6 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    5 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  108 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   43 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   33 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |    5 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    1 -
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    1 +
 .../amd/display/dc/gpio/dcn20/hw_factory_dcn20.c   |    6 +-
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |    6 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h     |    7 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |    5 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h   |  133 -
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  160 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |  105 -
 drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h |    8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   92 +
 drivers/gpu/drm/amd/display/dc/link/Makefile       |    6 +-
 .../dc/{core/dc_link_ddc.c => link/link_ddc.c}     |  409 +-
 .../i2caux_interface.h => dc/link/link_ddc.h}      |   70 +-
 .../drm/amd/display/dc/link/link_dp_capability.c   | 2169 +++++++
 .../drm/amd/display/dc/link/link_dp_capability.h   |   66 +
 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.c |  107 +
 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.h |   43 +
 .../gpu/drm/amd/display/dc/link/link_dp_dpia_bw.h  |   47 +-
 drivers/gpu/drm/amd/display/dc/link/link_dp_phy.c  |  145 +
 drivers/gpu/drm/amd/display/dc/link/link_dp_phy.h  |   51 +
 .../gpu/drm/amd/display/dc/link/link_dp_training.c | 1700 +++++
 .../gpu/drm/amd/display/dc/link/link_dp_training.h |  179 +
 .../display/dc/link/link_dp_training_128b_132b.c   |  260 +
 .../display/dc/link/link_dp_training_128b_132b.h   |   42 +
 .../amd/display/dc/link/link_dp_training_8b_10b.c  |  415 ++
 .../amd/display/dc/link/link_dp_training_8b_10b.h  |   61 +
 .../amd/display/dc/link/link_dp_training_auxless.c |   80 +
 .../amd/display/dc/link/link_dp_training_auxless.h |   35 +
 .../link_dp_training_dpia.c}                       |  308 +-
 .../amd/display/dc/link/link_dp_training_dpia.h    |   41 +
 .../dc/link/link_dp_training_fixed_vs_pe_retimer.c |  580 ++
 .../dc/link/link_dp_training_fixed_vs_pe_retimer.h |   45 +
 .../dc/{core/dc_link_dpcd.c => link/link_dpcd.c}   |   13 +-
 .../drm/amd/display/dc/{inc => link}/link_dpcd.h   |    5 +-
 drivers/gpu/drm/amd/display/dc/link/link_hpd.c     |  240 +
 drivers/gpu/drm/amd/display/dc/link/link_hpd.h     |   47 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   16 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  168 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |   22 +-
 .../drm/amd/display/include/ddc_service_types.h    |    5 +
 .../drm/amd/display/modules/freesync/freesync.c    |   64 +-
 .../drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h |    8 +
 .../amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h    |   50 +
 .../amd/include/asic_reg/xgmi/xgmi_6_1_0_sh_mask.h |   87 +
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h   |    2 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    8 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    2 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   42 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    6 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    3 +
 include/uapi/drm/amdgpu_drm.h                      |    6 +-
 166 files changed, 9765 insertions(+), 8198 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/link.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_ddc.c => link/link_ddc.c} (57%)
 rename drivers/gpu/drm/amd/display/{include/i2caux_interface.h => dc/link/link_ddc.h} (52%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_capability.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_phy.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_phy.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_dpia.c => link/link_dp_training_dpia.c} (83%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_dpcd.c => link/link_dpcd.c} (97%)
 rename drivers/gpu/drm/amd/display/dc/{inc => link}/link_dpcd.h (95%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hpd.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hpd.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/xgmi/xgmi_6_1_0_sh_mask.h
