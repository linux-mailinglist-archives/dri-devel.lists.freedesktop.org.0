Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08133801273
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 19:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B547D10E139;
	Fri,  1 Dec 2023 18:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44A910E0D6;
 Fri,  1 Dec 2023 18:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZjZmtl2DJqXCIHSBdqQ1WVpR6Jo++fRoaFfRdXUBiTMKi+jZl5Uu1OsK1qMg+THycPinPYGSLg/nlrSo1EraRa5rGpMmiJtpQrfXu+Tr/Yx5yOdL578SdHSDJk+VRCod7WVGaWpb9P6uNclKcoAryqsoR9QIoBPDCS6Mrs/5iWyBpPQKpGu5k0SW+WXizZ2oNrC8+xmK4N4kRVbu+M/wfxRDQ2fflEVydO36UQgV1WL8YeJUON7JxRmPl18agwbDWk3JlYZTqeWgFRD/FImi7xV28iCxZi1hTLPHk9G02ULZApH+iihAqxVXhuymDzU2ZjGoattU6VLZ1a5LdHVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZYWCEvs1lPyLIH0lc14fGyRIazrKDyAZn9AT4+xvdM=;
 b=Of6LgYPWaW/DUx+hWdqUmYU5xUQLfHlTMpr+B5KyHdHLaw7TayBb6eU9BgJ2lplDMr3U4NgMY0SqXEbbD7MP1Bebq8h6KXw43GbECLFCnsataqYM7GvVBjUatZVnUBeCErUUyo4YO40xwwcxWuRMV1Wr58xdSoAEku4qvQ6sX6Wu7zcvSpv+nvX0rzXKGrhVk7nthU3W69y5IoCFWISZBMDCRPLU0H7BZP4wvokJmG0H/2GCnfYHEu0L1mbkyVuSNyf2vLMXE7CQU0Gc6fvrB1NueSyZW5LKw/2CCGKH5GkfrCRIPytVZGy3do6DAWXYw/KjTThyUmnPupr7JbELRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZYWCEvs1lPyLIH0lc14fGyRIazrKDyAZn9AT4+xvdM=;
 b=3lhchkLyULRoGVl0k55cZM4DGCHvO5fQGfYQSGaAUG/dI72jWsaf2xQHk/4CZx/LhlKNQ/oXyK7o905Qon6SF4Vpq1mJxIyFtw9m1EfDGf9UrYgiymvnHHLRcMhBW8IOtKzn7xhKR74mjhLOd3egHzoIxKpRlP6FxiNqJVQoCyI=
Received: from BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Fri, 1 Dec
 2023 18:17:58 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::bf) by BYAPR08CA0026.outlook.office365.com
 (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27 via Frontend
 Transport; Fri, 1 Dec 2023 18:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 18:17:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 12:17:56 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.8
Date: Fri, 1 Dec 2023 13:17:42 -0500
Message-ID: <20231201181743.5313-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: e836ba3c-9c53-4fec-d223-08dbf299d8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4khqFeOGJlc0SpnjDclm3nQikxLvD/l6jH/B8T2r7Lu5UL0hvHaVdNj3ZB+t17H+Z+hxOH3waVxzjucfMvCyJNDp/Q2T+debdqFtoMROrP3h3GtEH/KHOHnWN29QFZ0Qb3XanFUkzK6hylAjY86y4W0mASgqoOiByyksDNKD7ywE+Pej3AaBOFZSmTJG0Me6l0kO61b5fyu9zcMEoHarFK6VvXMkacKyo18sXA8cSZZgOT9bw/VMZl+1ax0OXbskFLVBE3yd9jK3Pa0jX3CFRNDHikGPovDvgO9dyRTLc3OtXyyrFPwKulxXY3S6MINiqI+vptiWAW2CoEISsQ97Jxy0918QKgMVn/g2rpgwmeAhJH80uLeFBHz8sf0gb/8y744dPFiafJXsMVZE1BOvrvc054FNVbrzEd90MUz4/j5WbCC0thyPupwD+yyJKogBxXTzx+3+ifqmKtTWL40Tsj8ss8rLaWFM6Y4jnMemenqYKo3gI0+/uL6RE/mJ6Vk3F3HoLnBtLUju7fHgSmHYvYrjhcRhyxsop6eVCaHH/Senmjtbm8V3horrAPD9s6RloHKDNreQNj6bGPDN2aFSJG/RVOne/j/cjV1TIKt3h/SdhOk1MBKuwx5TyWjlU5VZNnvXiF3SdiwWyGadxIUE/gvIq45L0OGFvA9Z58LQyEkimwkAaiXJxw84ioQBRgZSRxhZQLssj+Gpwy1ZaDu8hTsIYla8tVvzCFNkJApNzqJ4ftGniMI/VF9UcAwXsswDuebULZ5qrx46JWIIzTMWxvGdAbXPWp/N0Owhlbya1To=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(66899024)(356005)(86362001)(40460700003)(83380400001)(47076005)(26005)(2616005)(16526019)(1076003)(4326008)(70586007)(2906002)(8676002)(4001150100001)(5660300002)(110136005)(966005)(8936002)(30864003)(478600001)(316002)(36756003)(19627235002)(41300700001)(7696005)(70206006)(6666004)(82740400003)(426003)(336012)(81166007)(40480700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 18:17:57.9936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e836ba3c-9c53-4fec-d223-08dbf299d8a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
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

New stuff for 6.8.

The following changes since commit e8c2d3e25b844ad8f7c8b269a7cfd65285329264:

  drm/amdgpu/gmc9: disable AGP aperture (2023-11-17 00:58:41 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.8-2023-12-01

for you to fetch changes up to b719a9c15d52d4f56bdea8241a5d90fd9197ce99:

  drm/amd/display: Fix NULL pointer dereference at hibernate (2023-11-30 18:26:31 -0500)

----------------------------------------------------------------
amd-drm-next-6.8-2023-12-01:

amdgpu:
- Add new 64 bit sequence number infrastructure.
  This will ultimately be used for user queue synchronization.
- GPUVM updates
- Misc code cleanups
- RAS updates
- DCN 3.5 updates
- Rework PCIe link speed handling
- Document GPU reset types
- DMUB fixes
- eDP fixes
- NBIO 7.9 updates
- NBIO 7.11 updates
- SubVP updates
- DCN 3.1.4 fixes
- ABM fixes
- AGP aperture fix
- DCN 3.1.5 fix
- Fix some potential error path memory leaks
- Enable PCIe PMEs
- Add XGMI, PCIe state dumping for aqua vanjaram
- GFX11 golden register updates
- Misc display fixes

amdkfd:
- Migrate TLB flushing logic to amdgpu
- Trap handler fixes
- Fix restore workers handling on suspend and reset
- Fix possible memory leak in pqm_uninit()

radeon:
- Fix some possible overflows in command buffer checking
- Check for errors in ring_lock

----------------------------------------------------------------
Abhinav Singh (1):
      drm/radeon: Fix warning using plain integer as NULL

Alex Deucher (3):
      drm/amdgpu: add pm metrics structure definition
      drm/amdgpu: fix AGP addressing when GART is not at 0
      drm/amdgpu: add amdgpu_reg_state.h

Alex Sierra (1):
      drm/amdgpu: Force order between a read and write to the same address

Alvin Lee (5):
      drm/amd/display: Include udelay when waiting for INBOX0 ACK
      drm/amd/display: Use DRAM speed from validation for dummy p-state
      drm/amd/display: Increase num voltage states to 40
      drm/amd/display: Enable SubVP on 1080p60 displays
      drm/amd/display: If P-State is supported try SubVP for smaller vlevel

André Almeida (1):
      drm/amd: Document device reset methods

Anthony Koo (3):
      drm/amd/display: Add new command to disable replay timing resync
      drm/amd/display: [FW Promotion] Release 0.0.193.0
      drm/amd/display: [FW Promotion] Release 0.0.194.0

Aric Cyr (3):
      drm/amd/display: Promote DC to 3.2.260
      drm/amd/display: 3.2.261
      drm/amd/display: Promote DAL to 3.2.262

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Implement a new 64bit sequence memory driver

Aurabindo Pillai (1):
      drm/amd/display: Fix a debugfs null pointer error

Bhuvana Chandra Pinninti (1):
      drm/amd/display: Refactor DSC into component folder

Camille Cho (1):
      drm/amd/display: Simplify brightness initialization

Candice Li (1):
      drm/amdgpu: Update EEPROM I2C address for smu v13_0_0

Daniel Miess (1):
      drm/amd/display: Enable DCN clock gating for DCN35

David Yat Sin (1):
      drm/amdkfd: Copy HW exception data to user event

Dennis Chan (2):
      drm/amd/display: Add new Replay command and Disabled Replay Timing Resync
      drm/amd/display: Disable Timing sync check in Full-Screen Video Case

Dinghao Liu (1):
      drm/amd/pm: fix a memleak in aldebaran_tables_init

Dmytro Laktyushkin (2):
      drm/amd/display: update dcn315 lpddr pstate latency
      drm/amd/display: block dcn315 dynamic crb allocation when unintended

Duncan Ma (1):
      drm/amd/display: Add disable timeout option

Fangzhi Zuo (1):
      drm/amd/display: Enable DSC Flag in MST Mode Validation

Felix Kuehling (3):
      drm/amdgpu: update mappings not managed by KFD
      drm/amdkfd: Move TLB flushing logic into amdgpu
      drm/amdkfd: Run restore_workers on freezable WQs

Gabe Teeger (1):
      Revert "drm/amd/display: Enable CM low mem power optimization"

Hamza Mahfooz (2):
      drm/amd/display: add a debugfs interface for the DMUB trace mask
      drm/amd/display: fix ABM disablement

Hawking Zhang (2):
      drm/amdgpu: Retire query/reset_ras_err_status from gfx_v9_4_3
      drm/amdgpu: Do not issue gpu reset from nbio v7_9 bif interrupt

Ian Chen (1):
      drm/amd/display: add skip_implict_edp_power_control flag for dce110

Ilya Bakoulin (2):
      drm/amd/display: Fix MPCC 1DLUT programming
      drm/amd/display: Add DSC granular throughput adjustment

Jonathan Kim (1):
      drm/amdgpu: update xgmi num links info post gc9.4.2

Krunoslav Kovac (1):
      drm/amd/display: Send PQ bit in AMD VSIF

Laurent Morichetti (1):
      drm/amdkfd: Clear the VALU exception state in the trap handler

Li Ma (1):
      drm/amdgpu: add init_registers for nbio v7.11

Lijo Lazar (8):
      drm/amd/pm: Add support to fetch pm metrics sample
      drm/amd/pm: Add pm metrics support to SMU v13.0.6
      drm/amd/pm: Add sysfs attribute to get pm metrics
      drm/amdgpu: Move mca debug mode decision to ras
      drm/amdgpu: Add reg_state sysfs attribute
      drm/amdgpu: Read aquavanjaram PCIE register state
      drm/amdgpu: Read aquavanjaram XGMI register state
      drm/amdgpu: Use another offset for GC 9.4.3 remap

Likun Gao (1):
      drm/amdgpu: distinguish rlc fw for different SKU

Lu Yao (1):
      drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer

Ma Jun (3):
      drm/amd/pm: Fix return value and drop redundant param
      drm/amd/pm: Move some functions to smu_v13_0.c as generic code
      drm/amd/pm: Make smu_v13_0_baco_set_armd3_sequence() static

Mario Limonciello (4):
      drm/amd: Use the first non-dGPU PCI device for BW limits
      drm/amd: Exclude dGPUs in eGPU enclosures from DPM quirks
      drm/amd: Enable PCIe PME from D3
      drm/amd/display: Fix NULL pointer dereference at hibernate

Max Tseng (2):
      drm/amd/display: replay: generalize the send command function usage
      drm/amd/display: replay: Augment Frameupdate Command

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix tiled display misalignment

Michael Strauss (2):
      drm/amd/display: Do not read DPREFCLK spread info from LUT on DCN35
      drm/amd/display: Update Fixed VS/PE Retimer Sequence

Mounika Adhuri (1):
      drm/amd/display: Refactor resource into component directory

Mukul Joshi (1):
      drm/amdkfd: Use common function for IP version check

Nicholas Kazlauskas (8):
      drm/amd/display: Add z-state support policy for dcn35
      drm/amd/display: Update DCN35 watermarks
      drm/amd/display: Add Z8 watermarks for DML2 bbox overrides
      drm/amd/display: Feed SR and Z8 watermarks into DML2 for DCN35
      drm/amd/display: Remove min_dst_y_next_start check for Z8
      drm/amd/display: Update min Z8 residency time to 2100 for DCN314
      drm/amd/display: Update DCN35 clock table policy
      drm/amd/display: Allow DTBCLK disable for DCN35

Nikita Zhandarovich (3):
      drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
      drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
      drm/radeon: check return value of radeon_ring_lock()

Parandhaman K (1):
      drm/amd/display: Refactor OPTC into component folder

Perry Yuan (1):
      drm/amdgpu: optimize RLC powerdown notification on Vangogh

Prike Liang (2):
      drm/amdgpu: add amdgpu runpm usage trace for separate funcs
      drm/amdgpu: correct the amdgpu runtime dereference usage count

Rodrigo Siqueira (1):
      drm/amd/display: Add missing chips for HDCP

RutingZhang (1):
      drm/amd/display: remove unnecessary braces to fix coding style

Sam James (1):
      amdgpu: Adjust kmalloc_array calls for new -Walloc-size

Shiwu Zhang (1):
      drm/amdgpu: expose the connected port num info through sysfs

Srinivasan Shanmugam (3):
      drm/amdgpu: Refactor 'amdgpu_connector_dvi_detect' in amdgpu_connectors.c
      drm/amdgpu: Add function parameter 'xcc_mask' not described in 'amdgpu_vm_flush_compute_tlb'
      drm/amd/display: Remove redundant DRM device struct in amdgpu_dm_, mst_types.c

Sung Joon Kim (1):
      drm/amd/display: Fix black screen on video playback with embedded panel

Taimur Hassan (3):
      drm/amd/display: Remove config update
      drm/amd/display: Fix conversions between bytes and KB
      drm/amd/display: Fix some HostVM parameters in DML

Tim Huang (1):
      drm/amdgpu: fix memory overflow in the IB test

Wayne Lin (1):
      drm/amd/display: adjust flow for deallocation mst payload

Wenjing Liu (5):
      drm/amd/display: Try to acquire a free OTG master not used in cur ctx first
      drm/amd/display: Prefer currently used OTG master when acquiring free pipe
      drm/amd/display: fix a pipe mapping error in dcn32_fpu
      drm/amd/display: update pixel clock params after stream slice count change in context
      drm/amd/display: always use mpc factor of 2 for stereo timings

Yang Wang (3):
      drm/amdgpu: correct mca ipid die/socket/addr decode
      drm/amdgpu: Fix missing mca debugfs node
      drm/amdgpu: enable mca debug mode on APU by default

Yihan Zhu (1):
      drm/amd/display: Enable CM low mem power optimization

ZhenGuo Yin (2):
      drm/amdkfd: Free gang_ctx_bo and wptr_bo in pqm_uninit
      drm/amdgpu: Skip access gfx11 golden registers under SRIOV

Zhongwei (1):
      drm/amd/display: force toggle rate wa for first link training for a retimer

 Documentation/gpu/amdgpu/display/dc-debug.rst      |  41 ++
 .../gpu/amdgpu/display/trace-groups-table.csv      |  29 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  35 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   5 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  96 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  69 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 118 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          | 247 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h          |  49 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |  15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  45 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  44 ++
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         | 211 +++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  20 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 160 +----
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  18 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   6 +
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |   4 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 664 ++++++++++-----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 118 ++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   4 +-
 drivers/gpu/drm/amd/display/Makefile               |   3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  34 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 107 +++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  53 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  49 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |   5 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   8 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 159 +++--
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   4 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  62 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   6 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  29 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  82 ++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   2 +
 drivers/gpu/drm/amd/display/dc/dce100/Makefile     |  46 --
 drivers/gpu/drm/amd/display/dc/dce110/Makefile     |   4 +-
 drivers/gpu/drm/amd/display/dc/dce112/Makefile     |   3 +-
 drivers/gpu/drm/amd/display/dc/dce120/Makefile     |   2 +-
 drivers/gpu/drm/amd/display/dc/dce80/Makefile      |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   4 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   2 -
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn315/Makefile     |  30 -
 drivers/gpu/drm/amd/display/dc/dcn316/Makefile     |  30 -
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |   8 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  34 +-
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |  30 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h  |   7 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |  20 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   1 -
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  12 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  15 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  78 ++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  84 ++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |   2 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  16 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  26 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  60 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   2 +
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |  26 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  10 +-
 .../drm/amd/display/dc/{ => dsc}/dcn20/dcn20_dsc.c |   0
 .../drm/amd/display/dc/{ => dsc}/dcn20/dcn20_dsc.h |   0
 .../drm/amd/display/dc/{ => dsc}/dcn35/dcn35_dsc.c |   0
 .../drm/amd/display/dc/{ => dsc}/dcn35/dcn35_dsc.h |   0
 .../gpu/drm/amd/display/dc/{inc/hw => dsc}/dsc.h   |   0
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |  15 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  42 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   2 -
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   3 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |  12 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 108 +---
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   1 +
 .../link_dp_training_fixed_vs_pe_retimer.c         |  16 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  46 +-
 .../dc/link/protocols/link_edp_panel_control.h     |   4 +-
 drivers/gpu/drm/amd/display/dc/optc/Makefile       | 108 ++++
 .../amd/display/dc/{ => optc}/dcn10/dcn10_optc.c   |   0
 .../amd/display/dc/{ => optc}/dcn10/dcn10_optc.h   |   0
 .../amd/display/dc/{ => optc}/dcn20/dcn20_optc.c   |   0
 .../amd/display/dc/{ => optc}/dcn20/dcn20_optc.h   |   2 +-
 .../amd/display/dc/{ => optc}/dcn201/dcn201_optc.c |   0
 .../amd/display/dc/{ => optc}/dcn201/dcn201_optc.h |   0
 .../amd/display/dc/{ => optc}/dcn30/dcn30_optc.c   |   0
 .../amd/display/dc/{ => optc}/dcn30/dcn30_optc.h   |   0
 .../amd/display/dc/{ => optc}/dcn301/dcn301_optc.c |   0
 .../amd/display/dc/{ => optc}/dcn301/dcn301_optc.h |   0
 .../amd/display/dc/{ => optc}/dcn31/dcn31_optc.c   |   0
 .../amd/display/dc/{ => optc}/dcn31/dcn31_optc.h   |   0
 .../amd/display/dc/{ => optc}/dcn314/dcn314_optc.c |   0
 .../amd/display/dc/{ => optc}/dcn314/dcn314_optc.h |   0
 .../amd/display/dc/{ => optc}/dcn32/dcn32_optc.c   |   0
 .../amd/display/dc/{ => optc}/dcn32/dcn32_optc.h   |   0
 .../amd/display/dc/{ => optc}/dcn35/dcn35_optc.c   |   0
 .../amd/display/dc/{ => optc}/dcn35/dcn35_optc.h   |   0
 drivers/gpu/drm/amd/display/dc/resource/Makefile   | 199 ++++++
 .../dc/{ => resource}/dce100/dce100_resource.c     |   0
 .../dc/{ => resource}/dce100/dce100_resource.h     |   0
 .../dc/{ => resource}/dce110/dce110_resource.c     |   0
 .../dc/{ => resource}/dce110/dce110_resource.h     |   0
 .../dc/{ => resource}/dce112/dce112_resource.c     |   0
 .../dc/{ => resource}/dce112/dce112_resource.h     |   0
 .../dc/{ => resource}/dce120/dce120_resource.c     |   2 +-
 .../dc/{ => resource}/dce120/dce120_resource.h     |   0
 .../amd/display/dc/resource/dce80/CMakeLists.txt   |   4 +
 .../dc/{ => resource}/dce80/dce80_resource.c       |   0
 .../dc/{ => resource}/dce80/dce80_resource.h       |   0
 .../dc/{ => resource}/dcn10/dcn10_resource.c       |  25 +-
 .../dc/{ => resource}/dcn10/dcn10_resource.h       |   0
 .../dc/{ => resource}/dcn20/dcn20_resource.c       |  40 +-
 .../dc/{ => resource}/dcn20/dcn20_resource.h       |   1 +
 .../dc/{ => resource}/dcn201/dcn201_resource.c     |  14 +-
 .../dc/{ => resource}/dcn201/dcn201_resource.h     |   0
 .../dc/{ => resource}/dcn21/dcn21_resource.c       |   9 +-
 .../dc/{ => resource}/dcn21/dcn21_resource.h       |   0
 .../dc/{ => resource}/dcn30/dcn30_resource.c       |   2 +-
 .../dc/{ => resource}/dcn30/dcn30_resource.h       |   0
 .../dc/{ => resource}/dcn301/dcn301_resource.c     |   4 +-
 .../dc/{ => resource}/dcn301/dcn301_resource.h     |   0
 .../dc/{ => resource}/dcn302/dcn302_resource.c     |   4 +-
 .../dc/{ => resource}/dcn302/dcn302_resource.h     |   0
 .../dc/{ => resource}/dcn303/dcn303_resource.c     |   4 +-
 .../dc/{ => resource}/dcn303/dcn303_resource.h     |   0
 .../dc/{ => resource}/dcn31/dcn31_resource.c       |   2 +-
 .../dc/{ => resource}/dcn31/dcn31_resource.h       |   0
 .../dc/{ => resource}/dcn314/dcn314_resource.c     |   2 +-
 .../dc/{ => resource}/dcn314/dcn314_resource.h     |   0
 .../dc/{ => resource}/dcn315/dcn315_resource.c     |   6 +-
 .../dc/{ => resource}/dcn315/dcn315_resource.h     |   0
 .../dc/{ => resource}/dcn316/dcn316_resource.c     |   0
 .../dc/{ => resource}/dcn316/dcn316_resource.h     |   0
 .../dc/{ => resource}/dcn32/dcn32_resource.c       |   5 +-
 .../dc/{ => resource}/dcn32/dcn32_resource.h       |  10 +
 .../dc/{ => resource}/dcn321/dcn321_resource.c     |   3 +-
 .../dc/{ => resource}/dcn321/dcn321_resource.h     |   0
 .../dc/{ => resource}/dcn35/dcn35_resource.c       |  27 +-
 .../dc/{ => resource}/dcn35/dcn35_resource.h       |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 155 ++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   1 +
 .../gpu/drm/amd/display/include/hdcp_msg_types.h   |   5 +
 .../drm/amd/display/modules/freesync/freesync.c    |   6 +-
 drivers/gpu/drm/amd/include/amdgpu_reg_state.h     | 153 +++++
 .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   |   8 +
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |   2 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |   2 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |  29 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  19 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  43 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  40 ++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  14 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  11 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c |   7 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h |   2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c |   9 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |   9 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h   |   2 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  37 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  15 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   3 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  40 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  36 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  77 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  36 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   1 +
 drivers/gpu/drm/radeon/clearstate_evergreen.h      |   8 +-
 drivers/gpu/drm/radeon/r100.c                      |   4 +-
 drivers/gpu/drm/radeon/r600_cs.c                   |   4 +-
 drivers/gpu/drm/radeon/si.c                        |   4 +
 222 files changed, 3434 insertions(+), 1524 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/trace-groups-table.csv
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dce100/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => dsc}/dcn20/dcn20_dsc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dsc}/dcn20/dcn20_dsc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dsc}/dcn35/dcn35_dsc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dsc}/dcn35/dcn35_dsc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{inc/hw => dsc}/dsc.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn10/dcn10_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn10/dcn10_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn20/dcn20_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn20/dcn20_optc.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn201/dcn201_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn201/dcn201_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn30/dcn30_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn30/dcn30_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn301/dcn301_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn301/dcn301_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn31/dcn31_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn31/dcn31_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn314/dcn314_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn314/dcn314_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn32/dcn32_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn32/dcn32_optc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn35/dcn35_optc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => optc}/dcn35/dcn35_optc.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce100/dce100_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce100/dce100_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce110/dce110_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce110/dce110_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce112/dce112_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce112/dce112_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce120/dce120_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce120/dce120_resource.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dce80/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce80/dce80_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce80/dce80_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn10/dcn10_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn10/dcn10_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn20/dcn20_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn20/dcn20_resource.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn201/dcn201_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn201/dcn201_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn21/dcn21_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn21/dcn21_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn30/dcn30_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn30/dcn30_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn301/dcn301_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn301/dcn301_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn302/dcn302_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn302/dcn302_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn303/dcn303_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn303/dcn303_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn31/dcn31_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn31/dcn31_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn314/dcn314_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn314/dcn314_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn315/dcn315_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn315/dcn315_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn316/dcn316_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn316/dcn316_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn32/dcn32_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn32/dcn32_resource.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn321/dcn321_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn321/dcn321_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn35/dcn35_resource.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn35/dcn35_resource.h (99%)
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_reg_state.h
