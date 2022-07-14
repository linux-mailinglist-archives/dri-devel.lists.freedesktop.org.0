Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AE5757A4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 00:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4282A10E7FD;
	Thu, 14 Jul 2022 22:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C22F894E7;
 Thu, 14 Jul 2022 21:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knfd7YjX3FvGHeT7Fz8xWoP9g9W0GthGf+eP5DAzPae9hRRq5uu2tioPdc4DmpxX8f4OcsWTQUWJgi+f45uLcvL/oVczGK7dCAaUSnmenGSEMjLZExpQdeY+8XnqppiQ418uTATSKMiKsCr6b/B2QzjADnBwxVzMVSlvLP6xXTY41gg/4uOaCX/kJ+kouxG7S8UlmBMDf733xEEFd+tZ+TciGIbStmPMbwTg9iifpAjN6oKiIdtVWbF3exW6+y900K4tbbkkNbevkLi5zeBUiP/jFgsCqvciYj9ExWX+PYwgCYsFlp+T581ibOaETtpL1J6di8PlsmSuARfbst9PTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5LYuSB4JBcog23p20Oa541y8Rw1xDuYSHCBNjCX2HI=;
 b=acI14s4FEOqWXLEmnaKPP9hCA/YGtz2+lJm7Lm6eCLae15bbtC0iaUrxHzGnVLvOizdSnUPUlRQrxbfk7WrJ9ERofHIY2AC6IBXpCxR+77UrOT+l3R0qJtOlyYDjK8SRB2TGvWNV1w0Tg56h4ZD+FCWdjAUvlZeaNNfRUqfZhoYlg7p+WRqPeDn6q2wWjJkxY0i2sesqMMZCqB80PJewG9ufToG2zID6P8JLAVxHFHqg9SeuZWZqPb6CHK5r4HaMGvD6HM37oPvAIOOPUb5cMU3coN+OHdeHsiT/A2bhQ+tCS0mfWIsyg1ah7R/aMYl3eeXuh1eFEBCW4h97sY5g0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5LYuSB4JBcog23p20Oa541y8Rw1xDuYSHCBNjCX2HI=;
 b=UogaQGIog7qPacSufF9RHbHtt/zIswQKQ3lzz7kLQEAHaQnZlU3E0M5JGrKkatnutcb+4l6BQKiM+HxDhXJ38R3waP2yZX2m1lnqjwfyIB9e6IhDDHLN1pWjU+3UzuXCQSYcZswqEgt9IO3QdLQhHv5YbYou4CkIx76z3QyY5QM=
Received: from BN9P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::11)
 by BYAPR12MB3350.namprd12.prod.outlook.com (2603:10b6:a03:ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 21:47:33 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::fa) by BN9P222CA0006.outlook.office365.com
 (2603:10b6:408:10c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Thu, 14 Jul 2022 21:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 21:47:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 14 Jul
 2022 16:47:31 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.20
Date: Thu, 14 Jul 2022 17:47:16 -0400
Message-ID: <20220714214716.8203-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0b6a2a3-188c-47bf-6a4c-08da65e27518
X-MS-TrafficTypeDiagnostic: BYAPR12MB3350:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tP3y1tnxc1lEMabG8MYrh7p9viEoBjDkuOtz6yitqYAYUNOxHglLLD3l9IeGJfxeHdIZaa69pCd5Tirpb02d8n+Z912O0E979JYhqWayK9xj6n1bqbcsziKm+PwpvWqR/2whfWKzkfk2J78jfCUJcPW4dxQ2mSxaK4YD5Yy4GozN5msGSSdgtpAw46kfwgV0lHj+H5wM7tyNmp3UaHwhUlMZ36fNGP5YGeVmeHePXEM84PaPabIEziPVjMra6vm3hh9PPeMzu8r8O4+TcYtcQzRcgf5wFUvAxqOF7a89QipqPa6EAChMY4vjXT8AFeyZ3Q5pJLnIhTnUQiAgwpjrYQApbPOMHCWCmk+XsvICXseCdyfO0rpG0IhMWp6Do5oCfVRbT0hdoU/Bv4A1Op5pIH6mpeogvrEjxpTzm3WiGrgjW085N6l546HPh9Hf8MlxiGZEjyssercfCRhm9h3idPQPX1gGh7n7vi71jU7NQzKpkOmHQApJzhTlXwqahGwAdc+dy3/MoqENY5fViroKmuAcIYw5rEw7OP8oKPs1RrzVIO2AacjiJdzwQB6kArwFOWdC+q9sOxVbLbCnDwzSzID4tQw7PzFJXHmnrxuYCcGYC08py7Popsihx+gqFxUS8La3ZC1JIjI59w+0od+5mqsYmR5caDlVOsmuyOaSXpldVBUus5THVVTZY8GXtyWTX4/jtGIKyRYRVcwSTSJ2iA49IdFxf6GdxE2C7QkFcgGyKxlViT6bm7AxoA3U+dwuXT3ZSmbFdCqRibTuYoLnpYFZTX2jFU3UGTSrRlAmbAg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(40470700004)(46966006)(86362001)(110136005)(5660300002)(8936002)(4326008)(36860700001)(30864003)(36756003)(966005)(70206006)(19627235002)(82310400005)(70586007)(40480700001)(2906002)(316002)(6666004)(40460700003)(426003)(16526019)(26005)(8676002)(41300700001)(7696005)(2616005)(47076005)(186003)(66574015)(478600001)(356005)(336012)(1076003)(81166007)(83380400001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 21:47:32.7113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b6a2a3-188c-47bf-6a4c-08da65e27518
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3350
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

A few more new things for 5.20.

The following changes since commit c5da61cf5bab30059f22ea368702c445ee87171a:

  drm/amdgpu/display: add missing FP_START/END checks dcn32_clk_mgr.c (2022-06-30 19:35:21 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.20-2022-07-14

for you to fetch changes up to b7be3ae759160aa3355ebeb0583f67fb9bda4dae:

  drm/amd/display: remove duplicate dcn314 includes (2022-07-13 20:57:05 -0400)

----------------------------------------------------------------
amd-drm-next-5.20-2022-07-14:

amdgpu:
- DCN3.2 updates
- DC SubVP support
- DP MST fixes
- Audio fixes
- DC code cleanup
- SMU13 updates
- Adjust GART size on newer APUs for S/G display
- Soft reset for GFX 11
- Soft reset for SDMA 6
- Add gfxoff status query for vangogh
- Improve BO domain pinning
- Fix timestamps for cursor only commits
- MES fixes
- DCN 3.1.4 support
- Misc fixes
- Misc code cleanup

amdkfd:
- Simplify GPUVM validation
- Unified memory for CWSR save/restore area
- fix possible list corruption on queue failure

radeon:
- Fix bogus power of two warning

UAPI:
- Unified memory for CWSR save/restore area for KFD
  Proposed userspace: https://lists.freedesktop.org/archives/amd-gfx/2022-June/080952.html

----------------------------------------------------------------
Alan Liu (1):
      drm/amd/display: Program ACP related register

Alex Deucher (11):
      drm/amdgpu: keep fbdev buffers pinned during suspend
      drm/amdgpu/display: disable prefer_shadow for generic fb helpers
      drm/amd/display: remove set but unused variable
      drm/amd/display: make get_refresh_rate() static
      drm/amd/display: fix non-x86/PPC64 compilation
      drm/amd/display: fix 32 bit compilation errors in dc_dmub_srv.c
      drm/amdgpu/gmc10: adjust gart size for parts that support S/G display
      drm/amdgpu: fix file permissions on some files
      drm/amd/display: make some dc_dmub_srv functions static
      drm/amd/display: attempt to fix the logic in commit_planes_for_stream()
      drm/amd/display: remove duplicate dcn314 includes

Alvin Lee (6):
      drm/amd/display: Add SubVP required code
      drm/amd/display: Change DET policy for MPO cases
      drm/amd/display: Make OPTC3 function accessible to other DCN
      drm/amd/display: Don't set dram clock change requirement for SubVP
      drm/amd/display: Maintain old audio programming sequence
      drm/amd/display: Exit SubVP if MPO in use

André Almeida (2):
      drm/amdpgu/debugfs: Simplify some exit paths
      drm/amd/pm: Implement get GFXOFF status for vangogh

Aric Cyr (3):
      drm/amd/display: 3.2.192
      drm/amd/display: 3.2.193
      drm/amd/display: 3.2.194

Aurabindo Pillai (5):
      drm/amd: Add debug mask for subviewport mclk switch
      drm/amd/display: remove stale debug setting
      drm/amd/display: Add callback to set dig mode
      drm/amd/display: Enable ODM combine default policy
      drm/amd/display: Add NBIO reg offsets to DC

Charlene Liu (1):
      drm/amd/display: add system info table log

Chris Park (4):
      drm/amd/display: Switch to correct DTO on HDMI
      drm/amd/display: Indicate stream change on ODM change
      drm/amd/display: OVT Update on InfoFrame and Mode Management
      drm/amd/display: Reduce SCDC Status Flags Definition

Dmytro Laktyushkin (2):
      drm/amd/display: disable timing sync b/w odm halves
      drm/amd/display: disable otg toggle w/a on boot

Duncan Ma (1):
      drm/amd/display: Add flag to modify MST delay

Eric Bernstein (3):
      drm/amd/display: Add function to set pixels per cycle
      drm/amd/display: Update gpuvm_max_page_table_levels IP param
      drm/amd/display: Fix null timing generator resource

Eric Huang (4):
      drm/amdkfd: add new flag for svm
      drm/amdkfd: change svm range evict
      drm/amdkfd: optimize svm range evict
      drm/amdkfd: bump KFD version for unified ctx save/restore memory

Ethan Wellenreiter (1):
      drm/amd/display: Re-implementing ARGB16161616 pixel format as 22

Evan Quan (2):
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/display: correct idle_power_optimizations disablement return value

Evgenii Krasnikov (1):
      drm/amd/display: add an option to skip wait for HPD when powering on eDP panel

Fangzhi Zuo (2):
      drm/amd/display: Fix dmub soft hang for PSR 1
      drm/amd/display: Ignore First MST Sideband Message Return Error

Guo Zhengkui (1):
      drm/amd/display: remove repeated includes

Hamza Mahfooz (2):
      drm/amd/display: enable PCON SST support for newer ASICs
      drm/amd/display: rename hdmi_frl_pcon_support

Harry Wentland (2):
      drm/amd/display: Move all linux includes into OS types
      drm/amd/display: Add DCN reg offsets to DC

Ilya Bakoulin (1):
      drm/amd/display: Fix black screen when disabling Freesync in OSD

Jack Xiao (7):
      drm/amdgpu/mes11: fix to unmap legacy queue
      drm/amdgpu/mes: fix mes submission in atomic context
      drm/amdgpu/mes: fix bo va unmap issue in mes
      drm/amdgpu/mes: set correct mes ring ready flag
      drm/amdgpu/mes11: initialize aggregated doorbell
      drm/amdgpu/sdma6: add aggregated doorbell support
      drm/amdgpu/gfx11: add aggregated doorbell support

Jianglei Nie (1):
      drm/amdgpu/mes: Fix an error handling path in amdgpu_mes_self_test()

Jimmy Kizito (3):
      drm/amd/display: Maintain consistent mode of operation during encoder assignment
      drm/amd/display: Disable TBT3 DSC work around by default.
      drm/amd/display: Fix uninitialized variable.

Jun Lei (2):
      drm/amd/display: Extend soc BB capabilitiy
      drm/amd/display: update DML1 logic for unbounded req handling

Kenneth Feng (2):
      drm/amd/pm: ac/dc change for smu_v13_0
      drm/amd/pm: drop the thermal_controller_type check

Kent Russell (1):
      drm/amdgpu: Fix acronym typo in glossary

Lang Yu (1):
      drm/amdkfd: simplify vm_validate_pt_pd_bos

Le Ma (2):
      drm/amdgpu/mes: init aggregated doorbell
      drm/amdgpu/mes: ring aggregatged doorbell when mes queue is unmapped

Leo Li (1):
      drm/amdgpu: Check BO's requested pinning domains against its preferred_domains

Likun Gao (4):
      drm/amdgpu: support gfx soft reset for gfx v11
      drm/amdgpu: enable soft reset for gfx 11
      drm/amdgpu: support SDMA soft recovery for sdma v6
      drm/amdgpu: support reset flag set for gpu reset

Mario Kleiner (1):
      drm/amd/display: Only use depth 36 bpp linebuffers on DCN display engines.

Martin Leung (2):
      drm/amd/display: Prepare for new interfaces
      drm/amd/display: guard for virtual calling destroy_link_encoders

Mateusz Jończyk (1):
      drm/radeon: avoid bogus "vram limit (0) must be a power of 2" warning

Maíra Canal (3):
      drm/amd/display: Remove return value of Calculate256BBlockSizes
      drm/amd/display: Remove duplicate code across dcn30 and dcn31
      drm/amd/display: Remove unused variables from vba_vars_st

Meenakshikumar Somasundaram (1):
      drm/amd/display: Remove configuration option for dpia hpd delay

Melissa Wen (1):
      drm/amd/display: correct check of coverage blend mode

Michael Strauss (1):
      drm/amd/display: Initialize lt_settings on instantiation

Michel Dänzer (1):
      drm/amd/display: Ensure valid event timestamp for cursor-only commits

Muhammad Ansari (1):
      drm/amd/display: Helper function for ALPM initialization

Nicholas Kazlauskas (4):
      drm/amd/display: Fix stream->link_enc unassigned during stream removal
      drm/amd/display: Guard against ddc_pin being NULL for AUX
      drm/amd/display: Remove incorrect ASSERT check for link_enc
      drm/amd/display: Guard against NULL link encoder in log hw state

Prike Liang (1):
      drm/amdkfd: correct the MEC atomic support firmware checking for GC 10.3.7

Robin Chen (1):
      drm/amd/display: Disable PSRSU when DSC enabled on the specific sink

Rodrigo Siqueira (6):
      drm/amd/display: Add missing registers for ACP
      drm/amd/display: Use two pixel per container for k1/k2 div
      drm/amd/display: Add basic infrastructure for enabling FAMS
      drm/amd/display: Add SubVP control lock
      drm/amd/display: Add minimal pipe split transition state
      drm/amd/display: Fix refresh rate issue on Club 3D

Roman Li (9):
      drm/amdgpu: Add reg headers for DCN314
      drm/amd/display: Add DCN314 IRQ services
      drm/amd/display: Add DCN314 clock manager
      drm/amd/display: Add DCN314 DC resources
      drm/amd/display: Add DCN314 DML calculation support
      drm/amd/display: Add DCN314 version identifiers
      drm/amd/display: Enable DCN314 in DC
      drm/amd/display: Add DMUB support for DCN314
      drm/amd/display: Enable DCN314 in DM

Saaem Rizvi (1):
      drm/amd/display: Removing assert statements for Linux

Samson Tam (4):
      drm/amd/display: Apply ODM 2:1 policy for single display configuration
      drm/amd/display: Fix windowed MPO video with ODM combine for DCN32
      drm/amd/display: fix unnecessary pipe split playing NV12 1080p MPO video
      drm/amd/display: Fix lag when moving windowed MPO across display using ODM 2:1 combine

Stanley.Yang (2):
      drm/amdgpu: Only send ras feature for gfx block
      drm/amdgpu: skip whole ras bad page framework on sriov

Stylon Wang (1):
      drm/amd/display: Fix new dmub notification enabling in DM

Wayne Lin (2):
      drm/amd/display: Clear edid when unplug mst connector
      drm/amd/display: Grab dc_lock before detecting link

Wenjing Liu (1):
      drm/amd/display: make enable link independent from verified link caps

Wesley Chalmers (1):
      drm/amd/display: Check for DP2.0 when checking ODM combine

Yang Li (2):
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Yefim Barashkin (1):
      drm/amd/pm: Prevent divide by zero

Zhongjun Tan (1):
      drm/amdgpu/display: Remove duplicated argument to ||

xinhui pan (2):
      drm/amdgpu: Fix one list corruption when create queue fails
      drm/amdgpu: Remove one duplicated ef removal

 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    20 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   107 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   104 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     8 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |     3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |     3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |     3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    82 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   263 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    17 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   116 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   133 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    12 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    12 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |    12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    79 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   131 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     2 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   225 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     8 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    11 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    19 +
 drivers/gpu/drm/amd/display/dc/Makefile            |     2 +-
 drivers/gpu/drm/amd/display/dc/basics/vector.c     |     2 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    48 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     9 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    28 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |     8 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |     7 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     8 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   751 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |    57 +
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |   391 +
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.h |    79 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |     7 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |     8 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |     8 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |     2 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |     5 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   541 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |     2 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |     2 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    55 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |     9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    54 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |    58 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    32 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   208 +-
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |     2 -
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     3 -
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |     2 -
 drivers/gpu/drm/amd/display/dc/dc.h                |    41 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   419 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     4 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     2 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     2 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    24 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     8 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    13 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |     8 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     2 -
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     5 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     3 -
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |     2 -
 drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c       |     2 -
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |     3 -
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.c       |     2 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |     5 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    |    14 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |     2 -
 .../drm/amd/display/dc/dce110/dce110_compressor.c  |     3 -
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    10 +-
 .../amd/display/dc/dce110/dce110_opp_regamma_v.c   |     2 -
 .../drm/amd/display/dc/dce110/dce110_resource.c    |     2 -
 .../drm/amd/display/dc/dce110/dce110_transform_v.c |     2 -
 .../drm/amd/display/dc/dce112/dce112_compressor.c  |     3 -
 .../drm/amd/display/dc/dce112/dce112_resource.c    |     2 -
 .../drm/amd/display/dc/dce120/dce120_resource.c    |     2 -
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |     2 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |     2 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |     2 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     3 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_ipp.c   |     2 -
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |     3 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |     2 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     2 -
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |     5 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    17 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |     2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    17 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |   219 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   116 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    12 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |     1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |     2 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |     4 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |     2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    22 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |   106 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     5 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   172 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    16 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    35 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |    28 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |    43 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   265 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |   158 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   448 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.h  |   311 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   340 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |    40 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   158 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.h    |    34 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |   239 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.h    |   255 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  2356 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.h    |    43 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     1 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |     4 +
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    20 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   247 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |    21 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    12 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   236 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |   117 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   684 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    20 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   260 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   526 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |     6 +
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |     2 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    21 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.h |    11 +
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    93 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   107 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    91 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  7420 +++
 .../display/dc/dml/dcn314/display_mode_vba_314.h   |    44 +
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |  1733 +
 .../dc/dml/dcn314/display_rq_dlg_calc_314.h        |    70 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    31 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |     2 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     3 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    18 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    44 +-
 drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c    |     2 -
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |     2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |     3 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     3 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |     2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    42 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |     8 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     7 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     2 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |     5 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |    10 +
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |     2 -
 .../amd/display/dc/irq/dce120/irq_service_dce120.c |     2 -
 .../amd/display/dc/irq/dce80/irq_service_dce80.c   |     2 -
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |     2 -
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |   434 +
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.h |    35 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |     2 -
 drivers/gpu/drm/amd/display/dc/os_types.h          |     3 +-
 .../amd/display/dc/virtual/virtual_link_encoder.c  |     2 -
 .../display/dc/virtual/virtual_stream_encoder.c    |     2 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   114 +-
 .../drm/amd/display/dmub/inc/dmub_subvp_state.h    |   183 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     1 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 .../gpu/drm/amd/display/include/set_mode_types.h   |     8 +-
 .../drm/amd/display/modules/color/color_gamma.c    |     3 -
 .../drm/amd/display/modules/freesync/freesync.c    |     2 -
 .../drm/amd/display/modules/power/power_helpers.c  |    33 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |     1 +
 .../amd/include/asic_reg/clk/clk_11_0_1_offset.h   |     0
 .../amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h  |     0
 .../drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h |     2 +
 .../amd/include/asic_reg/dcn/dcn_2_0_3_offset.h    |     0
 .../amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h   |     0
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_1_sh_mask.h   |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_4_offset.h    | 15245 +++++
 .../amd/include/asic_reg/dcn/dcn_3_1_4_sh_mask.h   | 61832 +++++++++++++++++++
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h  |     0
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h |     0
 .../amd/include/asic_reg/dpcs/dpcs_3_1_4_offset.h  |  7215 +++
 .../amd/include/asic_reg/dpcs/dpcs_3_1_4_sh_mask.h | 55194 +++++++++++++++++
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     6 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |     3 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |     9 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |     2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    38 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    26 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     2 +
 drivers/gpu/drm/radeon/radeon_device.c             |     2 +-
 include/uapi/linux/kfd_ioctl.h                     |     5 +-
 232 files changed, 160871 insertions(+), 1544 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_offset.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_offset.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_4_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_4_sh_mask.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_3_1_4_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_3_1_4_sh_mask.h
