Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFBC567949
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81D014BAC4;
	Tue,  5 Jul 2022 21:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA0814B864;
 Tue,  5 Jul 2022 21:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVrgyUXRf71M10xTdhLlrJ5dBOZVoZ2mj5BGBhAJ4kP8FncA7FFa2y2uSuOz8VluxL350lB0x3pfC6HFugskHvTzYMRbUEWq12I0g9bWDRH0DRN2HCgRZNW3HyPuF7R8njUaHPVApXkdtm+yi9ALpu8JGMAVLw4wkRXuxyeQfbKJWdT24FutrvZbQs7inJctvd5+8dcp3CtKBCk1angd0y49/xIi4BMq6UfIZLstuSMlGv0+BMuyx++SWBvvi5KEZm49dbES8TbbExBsiSALx/HOHOrkWgcZcwNOuniZDq+DX4jAI0PXTqypfqs7bkGuVRM8pmewzCieLcAIY1+YLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1omgtfl3kmPjtfAUu0Yqrxua/IOMvBnvnQ0lxLbPrw=;
 b=dVlgT38Gysnha1J8GQJoatCOjSgIsPFvdaeHs5fdLbb6+nS0mjf9+2RB7sk3HTfa0V36hn7TdmPVp8llR74nhtXOOOni10yskX3G1OnjWWPP0JjH/MOvUpS/RrkaQs17180Nva3sV8tPJKYSCDc0KZ0FDUJO7jExRZ60lDDWxfJJ+pW6abY6JNslINzSC3fddSTSGNoV15kxivLQ4umDzrEI/Puk+sqg1t1hLVRa5F1AR+Px2L2l7VxeIMEUZBGaNN85dkmq52zJjevGTvVZTkT3vWmNm0WGlOSBSX43WC+stN2PTl+a68exP0Kn5NE2HBc7hnSpavqeC3j+Fq7ncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1omgtfl3kmPjtfAUu0Yqrxua/IOMvBnvnQ0lxLbPrw=;
 b=ouci1PRWrFirV0/tHGPXyE+TQG8RXCtcxGS9WBdykaZKUnSFEvs53Bpw2u+doXEGyKYkXKGRzU70C9RosuZnogZq5koROPlp7OqKhXByLbNmlKgnWbQqwxJSeqmGDbjNCILUxhR1XmFjNB1F0RVr4iRJ0HMl4D6oBuK4b2bAw6s=
Received: from MWHPR03CA0024.namprd03.prod.outlook.com (2603:10b6:300:117::34)
 by BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Tue, 5 Jul
 2022 21:26:48 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::9a) by MWHPR03CA0024.outlook.office365.com
 (2603:10b6:300:117::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Tue, 5 Jul 2022 21:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 21:26:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 5 Jul
 2022 16:26:46 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.20
Date: Tue, 5 Jul 2022 17:26:33 -0400
Message-ID: <20220705212633.6037-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 292d9550-2b94-4b67-1a8f-08da5ecd116d
X-MS-TrafficTypeDiagnostic: BYAPR12MB3479:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZ3IXOJKC4mENQw0XM1J6EHE+9FpjdRkNW5jRKi+AF6rs0o9eqWtU9OqULixDch8l0EeWc7beFQp21u11/mukRauRq15lTUMrpUEAEZwnXW0Tmgi86UuL9YntR8KozoOf4m22rs4CYvlAtrTrUVpdFi+oFJIWe2hiYKmbxle1tBtVeP9WIbxPKkMjvvfImefsyB+yvn/q4anoSRn9zyLlmxoJzaMzD67sVI8SH+btonEj1Nn3CO9FuaKQ0KycuAhKiKAVXKDCLnUMr+8ubFtOSya1g1rPQl1GegFTcw6mtdi6YF3WLNcaEM3nYngLu5bxZpqKzT5T5FK31yR7MhAudePpdkix2x8FvgFIDLlQOgpXr00KwF1XyK2+QM/Y+7i6C891HgARI2yl7P6xhcNoXGmvrOERGQITn/QMy4lbto7H8ihbtZcGnRJNW24BbdZxDeDt4paJpXmC7iKSbqsVBXS40hr7Jjh2aMNJDdGjuAq8UL0tJ4zL+XJhwVl2k1Ucw3NPAuwNlAqIeYjQk047wT3CRd5mOEjgge4eEHRZ+1mkVZihcxge1wO7XJK6o49hSUli9yaH7hdN8no1JwhIHT9NZHQd71+pUFfUx+6Ect9gB0BpjsP1shlOgDtvgeSQGSsWsfDsEcMPq21TWUaIQ82mq8fF2J8gbrssMQG6Cbv5X7mt+xDDvBWsrbbfaIfNNcil/ej7DZvlgttFaoP4I1HVL8UewL2LoB1BIsi3M+w5ARCISWTbuZQH+5PybuEBffdz3w1DEfgv6teiI8YSN9eX+4lUvqgbeR2fN4btqLi+HxQbisGrO0VRnwiqBiX5OiyV8Ns9zEoQBFRr9aNOojl/NedTOZBdlVBL1hIytG33SWLatNy7JFPx/PfEI8i/VTZpsIac+VIZYEfigGhiA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(46966006)(40470700004)(356005)(110136005)(316002)(82310400005)(36756003)(82740400003)(36860700001)(81166007)(70206006)(966005)(34020700004)(4326008)(70586007)(40480700001)(8676002)(30864003)(26005)(2906002)(6666004)(41300700001)(47076005)(426003)(8936002)(83380400001)(1076003)(66574015)(186003)(5660300002)(336012)(478600001)(2616005)(40460700003)(7696005)(16526019)(86362001)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 21:26:47.8141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292d9550-2b94-4b67-1a8f-08da5ecd116d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
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

New stuff for 5.20.

The following changes since commit bf23729c7a5f44f0e863666b9364a64741fd3241:

  Merge tag 'amd-drm-next-5.19-2022-05-26-2' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-06-01 10:56:11 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.20-2022-07-05

for you to fetch changes up to c5da61cf5bab30059f22ea368702c445ee87171a:

  drm/amdgpu/display: add missing FP_START/END checks dcn32_clk_mgr.c (2022-06-30 19:35:21 -0400)

----------------------------------------------------------------
amd-drm-next-5.20-2022-07-05:

amdgpu:
- Various spelling and grammer fixes
- Various eDP fixes
- Various DMCUB fixes
- VCN fixes
- GMC 11 fixes
- RAS fixes
- TMZ support for GC 10.3.7
- GPUVM TLB flush fixes
- SMU 13.0.x updates
- DCN 3.2 Support
- DCN 3.2.1 Support
- MES updates
- GFX11 modifiers support
- USB-C fixes
- MMHUB 3.0.1 support
- SDMA 6.0 doorbell fixes
- Initial devcoredump support
- Enable high priority gfx queue on asics which support it
- Enable GPU reset for SMU 13.0.4
- OLED display fixes
- MPO fixes
- DC frame size fixes
- ASPM support for PCIE 7.4/7.6
- GPU reset support for SMU 13.0.0
- GFX11 updates
- VCN JPEG fix
- BACO support for SMU 13.0.7
- VCN instance handling fix
- GFX8 GPUVM TLB flush fix
- GPU reset rework
- VCN 4.0.2 support
- GTT size fixes
- DP link training fixes
- LSDMA 6.0.1 support
- Various backlight fixes
- Color encoding fixes
- Backlight config cleanup
- VCN 4.x unified queue cleanup

amdkfd:
- MMU notifier fixes
- Updates for GC 10.3.6 and 10.3.7
- P2P DMA support using dma-buf
- Add available memory IOCTL
- SDMA 6.0.1 fix
- MES fixes
- HMM profiler support

radeon:
- License fix
- Backlight config cleanup

UAPI:
- Add available memory IOCTL to amdkfd
  Proposed userspace: https://www.mail-archive.com/amd-gfx@lists.freedesktop.org/msg75743.html
- HMM profiler support for amdkfd
  Proposed userspace: https://lists.freedesktop.org/archives/amd-gfx/2022-June/080805.html

----------------------------------------------------------------
Ahmad Othman (2):
      drm/amd/display: Add support for HF-VSIF
      drm/amd/display: Adding VTEM to dc

Alan Liu (1):
      drm/amdgpu/display/dc: Add ACP_DATA register

Alex Deucher (27):
      drm/amdgpu: update VCN codec support for Yellow Carp
      drm/amdgpu: simplify amdgpu_device_asic_has_dc_support()
      drm/amdgpu: convert sienna_cichlid_get_default_config_table_settings() to IP version
      drm/amdgpu: convert sienna_cichlid_populate_umd_state_clk() to use IP version
      drm/amdgpu: simplify the logic in amdgpu_device_parse_gpu_info_fw()
      drm/amdgpu: convert nbio_v2_3_clear_doorbell_interrupt() to IP version
      drm/amdgpu/gmc11: enable AGP aperture
      drm/amdgpu/swsmu: add SMU mailbox registers in SMU context
      drm/amdgpu/swsmu: use new register offsets for smu_cmn.c
      drm/amdgpu: fix up comment in amdgpu_device_asic_has_dc_support()
      drm/amdgpu/display: Protect some functions with CONFIG_DRM_AMD_DC_DCN
      drm/amdgpu/discovery: add comments about VCN instance handling
      drm/amdgpu/display: make some functions static
      drm/amdgpu/display: fix DCN3.2 Makefiles for non-x86
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v13.0.4
      drm/amdgpu: simplify amdgpu_ucode_get_load_type()
      drm/amdkfd: fix warning when CONFIG_HSA_AMD_P2P is not set
      Revert "drm/amdgpu/display: Protect some functions with CONFIG_DRM_AMD_DC_DCN"
      drm/amdgpu/display: make FP handling in Makefiles consistent
      drm/radeon: fix incorrrect SPDX-License-Identifiers
      drm/amdgpu: Adjust logic around GTT size (v3)
      drm/amdgpu: fix adev variable used in amdgpu_device_gpu_recover()
      Revert "drm/amdgpu/display: set vblank_disable_immediate for DC"
      drm/amdgpu/display: reduce stack size in dml32_ModeSupportAndSystemConfigurationFull()
      drm/amdgpu/display: drop set but unused variable
      drm/amdgpu: fix documentation warning
      drm/amdgpu/display: add missing FP_START/END checks dcn32_clk_mgr.c

Alexey Kodanev (1):
      drm/radeon: fix potential buffer overflow in ni_set_mc_special_registers()

Alvin (1):
      drm/amd/display: Don't clear ref_dtbclk value

Alvin Lee (7):
      drm/amd/display: Add missing instance for clock source register
      drm/amd/display: Implement WM table transfer for DCN32/DCN321
      drm/amd/display: Remove W/A for ODM memory pins
      drm/amd/display: Implement DTBCLK ref switching on dcn32
      drm/amd/display: Add debug option for exiting idle optimizations on cursor updates
      drm/amd/display: Update DPPCLK programming sequence
      drm/amd/display: Update SW state correctly for FCLK

Andrey Grodzovsky (11):
      Revert "workqueue: remove unused cancel_work()"
      drm/amdgpu: Cache result of last reset at reset domain level.
      drm/admgpu: Serialize RAS recovery work directly into reset domain queue.
      drm/amdgpu: Add work_struct for GPU reset from debugfs
      drm/amdgpu: Add work_struct for GPU reset from kfd.
      drm/amdgpu: Rename amdgpu_device_gpu_recover_imp back to amdgpu_device_gpu_recover
      drm/amdgpu: Stop any pending reset if another in progress.
      drm/amdgpu: Add put fence in amdgpu_fence_driver_clear_job_fences
      drm/amdgpu: Prevent race between late signaled fences and GPU reset.
      drm/sched: Partial revert of 'drm/sched: Keep s_fence->parent pointer'
      drm/amdgpu: Follow up change to previous drm scheduler change.

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.119.0

Aric Cyr (6):
      drm/amd/display: 3.2.187
      drm/amd/display: 3.2.188
      drm/amd/display: 3.2.189
      drm/amd/display: 3.2.190
      drm/amd/display: Change initializer to single brace
      drm/amd/display: 3.2.191

Arunpravin Paneer Selvam (3):
      drm/amd/amdgpu: Enable high priority gfx queue
      drm/amd/amdgpu: add pipe1 hardware support
      drm/amd/amdgpu: Fix alignment issue

Aurabindo Pillai (25):
      drm/amd/display: remove stale config guards
      drm/amd: Add atomfirmware.h definitions needed for DCN32/321
      drm/amd/display: Add DCN32/321 version identifiers
      drm/amd: add register headers for DCN32/321
      drm/amd/display: Add DMCUB source files and changes for DCN32/321
      drm/amd/display: add dcn32 IRQ changes
      drm/amd/display: add GPIO changes for DCN32/321
      drm/amd/display: DML changes for DCN32/321
      drm/amd/display: add CLKMGR changes for DCN32/321
      drm/amd/display: add DCN32/321 specific files for Display Core
      drm/amd/display: Add dependant changes for DCN32/321
      drm/amd/display: Add DM support for DCN32/DCN321
      drm/amd/display: add DCN32 to IP discovery table
      drm/amd: Add GFX11 modifiers support to AMDGPU (v3)
      drm/amd/display: add missing interrupt handlers for DCN32/DCN321
      drm/amd/display: disable idle optimizations
      drm/amd/display: update disp pattern generator routine for DCN30
      drm/amd/display: fix null pointer deref error
      drm/amd/display: ignore modifiers when checking for format support
      drm/amd/display: dml: move some variables to heap
      drm/amd/display: add missing reg defs for DCN3x HUBBUB
      drm/amd/display: fix array index in DML
      drm/amd/display: fix incorrect comparison in DML
      drm/amd: Load TA firmware for DCN321/DCN32
      drm/amd/display: expose additional modifier for DCN32/321

Bas Nieuwenhuizen (1):
      Revert "drm/amd/display: ignore modifiers when checking for format support"

Candice Li (1):
      drm/amdgpu: Resolve RAS GFX error count issue after cold boot on Arcturus

Carlos Llamas (1):
      drm/fourcc: fix integer type usage in uapi header

Chaitanya Dhere (2):
      drm/amd/display: FCLK P-state support updates
      drm/amd/display: Implement a pme workaround function

Chandan Vurdigere Nataraj (4):
      drm/amdgpu/display: Remove unnecessary typecasts and fix build issues
      drm/amdgpu/display: Fix compilation issues
      drm/amd/display : Log DP link training failure reason
      drm/amd/display: Re-org and cleanup the redundant code

Charlene Liu (2):
      drm/amd/display: use updated clock source init routine
      drm/amd/display: FVA timing adjustment

Chengming Gui (1):
      Revert "drm/amdgpu/gmc11: enable AGP aperture"

Chris Park (1):
      drm/amd/display: Add HDMI member to DTO

Christian König (2):
      drm/amdgpu: fix limiting AV1 to the first instance on VCN3
      drm/amdgpu: always flush the TLB on gfx8

Colin Ian King (2):
      drm/amdkfd: Fix spelling mistake "mechanim" -> "mechanism"
      drm/amdgpu/display: Fix spelling mistake "supporing" -> "supporting"

Cruise Hung (1):
      drm/amd/display: Remove compiler warning

Dan Carpenter (1):
      drm/amdgpu: delete duplicate condition in gfx_v11_0_soft_reset()

Daniel Phillips (1):
      drm/amdkfd: Add available memory ioctl

Darren Powell (2):
      amdgpu/pm: Fix incorrect variable for size of clocks array
      amdgpu/pm: Fix possible array out-of-bounds if SCLK levels != 2

David Zhang (19):
      drm/amd/display: align dmub cmd header to latest dmub FW to support PSR-SU
      drm/amd/display: feed PSR-SU as psr version to dmub FW
      drm/amd/display: combine dirty rectangles in DMUB FW
      drm/amd/display: update GSP1 generic info packet for PSRSU
      drm/amd/display: revise Start/End SDP data
      drm/amd/display: program PSR2 DPCD Configuration
      drm/amd/display: Passing Y-granularity to dmub fw
      drm/amd/display: Set default value of line_capture_indication
      drm/amd/display: add vline time in micro sec to PSR context
      drm/amd/display: fix system hang when PSR exits
      drm/amd/display: Set PSR level to enable ALPM by default
      drm/amd/display: use HW lock mgr for PSR-SU
      drm/amd/display: PSRSU+DSC WA for specific TCON
      drm/amd/display: add shared helpers to update psr config fields to power module
      drm/amd/display: calculate psr config settings in runtime in DM
      drm/amd/display: update cursor position to DMUB FW
      drm/amd/display: expose AMD specific DPCD for PSR-SU-RC support
      drm/amd/display: Add PSR-SU-RC support in DC
      drm/amd/display: pass panel instance in DMUB dirty rect command

Dillon Varone (9):
      drm/amd/display: Fix USBC link creation
      drm/amd/display: Add guard for FCLK pstate message to PMFW for DCN321
      drm/amd/display: Various DML fixes to enable higher timings
      drm/amd/display: Select correct DTO source
      drm/amd/display: Ensure that DMCUB fw in use is loaded by DC and not VBIOS
      drm/amd/display: Add additional guard for FCLK pstate message for DCN321
      drm/amd/display: set dram speed for all states
      drm/amd/display: Disable DTB Ref Clock Switching in dcn32
      drm/amd/display: change dsc image width cap for dcn32 and dcn321

Dmytro Laktyushkin (1):
      drm/amd/display: Fix in dp link-training when updating payload allocation table

Duncan Ma (4):
      drm/amd/display: Add ODM seamless boot support
      drm/amd/display: Blank eDP on enable drv if odm enabled
      drm/amd/display: Correct min comp buffer size
      drm/amd/display: Fix dpp dto for disabled pipes

Eric Bernstein (1):
      drm/amd/display: Use DTBCLK for valid pixel clock

Evan Quan (17):
      drm/amd/pm: suppress compile warnings about possible unaligned accesses
      drm/amdgpu: suppress the compile warning about 64 bit type
      drm/amd/pm: correct the way for retrieving current uclk frequency
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/pm: enable fclk ds feature for SMU 13.0.0
      drm/amd/pm: enable FW CTF feature for SMU 13.0.0
      drm/amd/pm: drop unneeded thermal_controller_type check
      drm/amd/pm: optimize the interface for dpm feature status query
      drm/amdgpu: enable ASPM support for PCIE 7.4.0/7.6.0
      drm/amdgpu: avoid to perform undesired clockgating operation
      drm/amd/pm: enable mode1 reset support for SMU 13.0.0
      drm/amd/pm: drop redundant declarations
      drm/amd/pm: drop unneeded dpm features disablement for SMU 13.0.0/7
      drm/amd/pm: enable UCLK DS feature for SMU 13.0.0
      drm/amd/pm: enable MACO support for SMU 13.0.0
      drm/amdgpu: update GFX11 cs settings
      drm/amd/pm: enable VR0 HOT support for SMU 13.0.0

Fangzhi Zuo (1):
      drm/amd/display: Halve DTB Clock Value for DCN32

Felipe Clark (2):
      drm/amd/display: Firmware assisted MCLK switch and FS
      drm/amd/display: Pass vrr mode to dcn

Felix Kuehling (1):
      drm/amdkfd: Document and fix GTT BO kmap API

Gabe Teeger (1):
      drm/amd/display: Update optimized blank calc and programming

George Shen (5):
      drm/amd/display: Fix in overriding DP drive settings
      drm/amd/display: Fix typo in override_lane_settings
      drm/amd/display: Handle downstream LTTPR with fixed VS sequence
      drm/amd/display: Remove unused vendor specific w/a
      drm/amd/display: Fix divide-by-zero in DPPCLK and DISPCLK calculation

Graham Sider (4):
      drm/amdgpu: Remove break for VMID loop TLB flush on MES
      drm/amdgpu: Fetch MES scheduler/KIQ versions
      drm/amdkfd: Enable GFX11 usermode queue oversubscription
      drm/amdgpu: Update mes_v11_api_def.h

Guchun Chen (1):
      Revert "drm/amdgpu: Ensure the DMA engine is deactivated during set ups"

Hans de Goede (2):
      drm/amdgpu: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs
      drm/radeon: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs

Hansen Dsouza (1):
      drm/amd/display: Enable 3 plane MPO

Harry VanZyllDeJong (1):
      drm/amd/display: Add vrr_active_variable to dc_stream_update

Huang Rui (7):
      drm/amdgpu: introduce two work mode for imu
      drm/amdgpu: use the callback function for reset status polling on IMU
      drm/amdgpu: add mmhub v3_0_1 headers
      drm/amdgpu: add mmhub v3_0_1 ip block
      drm/amdgpu/pm: update MP v13_0_4 smu message register marco
      drm/amdgpu/pm: implement the SMU_MSG_EnableGfxImu function
      drm/amdgpu: add apu sequence in the imu v11

Hung, Cruise (1):
      drm/amd/display: Fix DMUB outbox trace in S4 (#4465)

Ian Chen (2):
      drm/amd/display: DAL ACR, dc part, fix missing dcn30
      drm/amd/display: Drop unnecessary detect link code

Ilya (1):
      drm/amd/display: Fix possible infinite loop in DP LT fallback

Jack Xiao (9):
      drm/amdgpu/mes11: update mes11 api interface
      drm/amdgpu/gmc11: avoid cpu accessing registers to flush VM
      drm/amdgpu: add mc wptr addr support for mes
      drm/amdgpu/mes11: update mes interface for acessing registers
      drm/amdgpu: add common interface for mes misc op
      drm/amdgpu/mes11: add mes11 misc op
      drm/amdgpu/mes: add mes register access interface
      drm/amdgpu: enable mes to access registers v2
      Revert "drm/amdgpu/gmc11: avoid cpu accessing registers to flush VM"

Jesse Zhang (1):
      drm/amdkfd:Fix fw version for 10.3.6

Jiang Jian (3):
      drm/amdgpu: vm - drop unexpected word "the" in the comments
      gpu/drm/radeon: Fix typo in comments
      drm/amdgpu: drop unexpected word 'for' in comments

Jiapeng Chong (1):
      drm/amdgpu: make program_imu_rlc_ram static

Jimmy Kizito (2):
      drm/amd/display: Avoid reading LTTPR caps in non-LTTPR mode.
      drm/amd/display: Fix entry into transient encoder assignment mode.

JinZe.Xu (1):
      drm/amd/display: Change HDMI judgement condition.

Jingwen Zhu (1):
      drm/amd/display: set link fec status during init for DCN32

Jonathan Kim (1):
      drm/amdkfd: fix cu mask for asics with wgps

Joseph Greathouse (1):
      drm/amdgpu: Add MODE register to wave debug info in gfx11

Joshua Aberback (1):
      drm/amd/display: Blank for uclk OC in dm instead of dc

Joshua Ashton (1):
      amd/display/dc: Fix COLOR_ENCODING and COLOR_RANGE doing nothing for DCN20+

Jun Lei (2):
      drm/amd/display: add new pixel rate programming
      drm/amd/display: Introduce new update_clocks logic

Kenneth Feng (6):
      drm/amd/amdgpu: align the cg and pg settings
      drm/amd/pm: add interface to deallocate power_context for smu_v13_0_7
      drm/amd/pm: enable BACO on smu_v13_0_7
      drm/amd/pm: update the driver if header for smu_v13_0_7
      drm/amd/pm: enable gfxoff on smu_v13_0_7
      drm/amd/pm: support BAMACO reset on smu_v13_0_7

Kent Russell (1):
      drm/amdgpu: Fix typos in amdgpu_stop_pending_resets

Lang Yu (1):
      drm/amdkfd: add pinned BOs to kfd_bo_list

Lei, Jun (1):
      drm/amd/display: Extend soc BB capabilitiy

Leo Li (2):
      drm/amd/display: Implement MPO PSR SU
      drm/amd/display: Use pre-allocated temp struct for bounding box update

Leslie Shi (1):
      drm/amdgpu: Remove useless amdgpu_display_freesync_ioctl() declaration

Leung, Martin (2):
      drm/amd/display: revert Blank eDP on disable/enable drv
      drm/amdgpu/display: Prepare for new interfaces

Mario Limonciello (3):
      drm/amdkfd: Add GC 10.3.6 and 10.3.7 KFD definitions
      drm/amd: Don't show warning on reading vbios values for SMU13 3.1
      drm/amd: Revert "drm/amd/display: keep eDP Vdd on when eDP stream is already enabled"

Martin Leung (2):
      drm/amd/display: cleaning up smu_if to add future flexibility
      drm/amd/display: Add null check to dc_submit_i2c_oem

Mauro Carvalho Chehab (2):
      drm/amdgpu/amdgpu_dm: fix kernel-doc markups
      drm/amd/amd_shared.h: Add missing doc for PP_GFX_DCS_MASK

Michel Dänzer (1):
      drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl

Mitchell Augustin (1):
      amdgpu: amdgpu_device.c: Removed trailing whitespace

Mohammad Zafar Ziya (1):
      drm/amdgpu/jpeg2: Add jpeg vmid update under IB submit

Nathan Chancellor (1):
      drm/amd/display: Fix indentation in dcn32_get_vco_frequency_from_reg()

Nicholas Kazlauskas (3):
      drm/amd/display: Pass the new context into disable OTG WA
      Revert "drm/amd/display: Pass the new context into disable OTG WA"
      drm/amd/display: Copy hfvsif_infopacket when stream update

Oliver Logush (1):
      drm/amd/display: Drop unused privacy_mask setters and getters

Philip Yang (14):
      drm/amdkfd: Use mmget_not_zero in MMU notifier
      drm/amdgpu: Update PDEs flush TLB if PTB/PDB moved
      drm/amdkfd: Fix partial migration bugs
      drm/amdkfd: Add queue to MES if it becomes active
      drm/amdkfd: Free queue after unmap queue success
      Revert "drm/amdkfd: Free queue after unmap queue success"
      drm/amdkfd: Add KFD SMI event IDs and triggers
      drm/amdkfd: Enable per process SMI event
      drm/amdkfd: Add GPU recoverable fault SMI event
      drm/amdkfd: Add migration SMI event
      drm/amdkfd: Add user queue eviction restore SMI event
      drm/amdkfd: Add unmap from GPU SMI event
      drm/amdkfd: Asynchronously free smi_client
      drm/amdkfd: Bump KFD API version for SMI profiling event

Qingqing Zhuo (2):
      drm/amd/display: update topology_update_input_v3 struct
      drm/amd/display: Fix DC warning at driver load

Rahul Kumar (1):
      drm/amdgpu/display/dc: Fix null pointer exception

Ramesh Errabolu (4):
      drm/amdkfd: Define config HSA_AMD_P2P to support peer-to-peer
      drm/amdgpu: Add peer-to-peer support among PCIe connected AMD GPUs
      drm/amdkfd: Extend KFD device topology to surface peer-to-peer links
      drm/amdkfd: Remove field io_link_count from struct kfd_topology_device

Robin Chen (1):
      drm/amd/display: refactor dirty rect dmub command decision

Rodrigo Siqueira (14):
      drm/amd/display: Remove duplicated macro
      drm/amd/display: Reduce frame size in the bouding box for DCN20
      drm/amd/display: Reduce frame size in the bouding box for DCN301
      drm/amd/display: Reduce frame size in the bouding box for DCN31/316
      drm/amd/display: Reduce frame size in the bouding box for DCN21
      drm/amd/display: Drop unnecessary guard from DC resource
      drm/amd/display: Check minimum disp_clk and dpp_clk debug option
      drm/amd/display: Get VCO frequency from registers
      drm/amd/display: Update hook dcn32_funcs
      drm/amd/display: Drop duplicate define
      drm/amd/display: Fix __umoddi3 undefined for 32 bit compilation
      drm/amd/display: Fix __floatunsidf undefined for 32 bit compilation
      drm/amd/display: Fix __muldf3 undefined for 32 bit compilation
      drm/amd/display: Fix __nedf2 undefined for 32 bit compilation

Roman Li (2):
      drm/amdgpu: fix aper_base for APU
      drm/amd/display: Cap OLED brightness per max frame-average luminance

Ruijing Dong (4):
      drm/amdgpu/vcn: add unified queue ib test
      drm/amdgpu/vcn: support unified queue only in vcn4
      drm/amdgpu/vcn: adjust unified queue code format
      drm/amdgpu/vcn: fix no previous prototype warning

Ruili Ji (1):
      drm/amdgpu: To flush tlb for MMHUB of RAVEN series

Saaem Rizvi (1):
      drm/amd/display: Add SMU logging code

Samson Tam (4):
      drm/amd/display: do not override CURSOR_REQ_MODE when SubVP is not enabled
      drm/amd/display: Updates for OTG and DCCG clocks
      drm/amd/display: Match dprefclk with clk registers
      drm/amd/display: Fix comments

Shah Dharati (1):
      drm/amd/display: Fix monitor flash issue

Sherry Wang (1):
      drm/amd/display: Read Golden Settings Table from VBIOS

Somalapuram Amaranath (2):
      drm/amdgpu: save the reset dump register value for devcoredump
      drm/amdgpu: adding device coredump support

Souptick Joarder (HPE) (1):
      drm/amd/display: Removed unused variable ret

Stanley.Yang (4):
      drm/amdgpu: fix ras supported check
      drm/amdgpu/pm: support mca_ceumc_addr in ecctable
      drm/amdgpu: print umc correctable error address
      drm/amdgpu/pm: adjust EccInfo_t struct

Sung Joon Kim (2):
      drm/amd/display: Fix eDP not light up on resume
      drm/amd/display: Turn off internal backlight when plugging external monitor

Sunil Khatri (1):
      drm/amdgpu: enable tmz by default for GC 10.3.7

Tim Huang (2):
      drm/amdgpu/pm: correct the firmware flag address for SMU IP v13.0.4
      drm/amdgpu/pm: remove the repeated EnableGfxImu message sending

Tom Rix (2):
      drm/amd/display: Remove unused globals FORCE_RATE and FORCE_LANE_COUNT
      drm/amd/display: change to_dal_irq_source_dnc32() storage class specifier to static

Wayne Lin (5):
      drm/amd/display: Detect dpcd_rev when hotplug mst monitor
      drm/amd/display: Revert "drm/amd/display: Add flag to detect dpms force off during HPD"
      drm/amd/display: Revert "drm/amd/display: turn DPMS off on connector unplug"
      drm/amd/display: Release remote dc_sink under mst scenario
      drm/amd/display: Take emulated dc_sink into account for HDCP

Wenjing Liu (5):
      drm/amd/display: add DP sanity checks during enable stream
      drm/amd/display: lower lane count first when CR done partially fails in EQ
      drm/amd/display: Enrich the log in MST payload update
      drm/amd/display: rename lane_settings to hw_lane_settings
      drm/amd/display: extract update stream allocation to link_hwss

Xiaohui Zhang (2):
      drm/radeon: integer overflow in radeon_mode_dumb_create()
      drm/radeon: Initialize fences array entries in radeon_sa_bo_next_hole

Xiaojian Du (2):
      drm/amdgpu: add CSDMA reg offsets for NBIO v7.7.0
      drm/amdgpu: fix sdma doorbell issue on SDMA v6.0 and NBIO v7.7

Yang Wang (2):
      drm/amd/pm: fix driver reload SMC firmware fail issue for smu13
      drm/amd/pm: skip to set mp1 unload state in special case

Yifan Zhang (6):
      drm/amdgpu/mes: only invalid/prime icache when finish loading both pipe MES FWs.
      drm/amdgpu/discovery: enable vcn/jpeg v4_0_2
      drm/amd: disable GPA mode in backdoor load
      drm/amdgpu: remove redundant enable_mes and enable_mes_kiq
      drm/amdgpu: add LSDMA block for LSDMA v6.0.1
      drm/amdkfd: correct sdma queue number of sdma 6.0.1

ZhenGuo Yin (1):
      drm/amdgpu: fix scratch register access method in SRIOV

hengzhou (1):
      drm/amd/display: Wait DMCUB to idle state before reset.

hersen wu (2):
      drm/amd/display: dsc validate fail not pass to atomic check
      drm/amd/display: add mst port output bw check

pengfuyuan (1):
      drm/amd: Fix spelling typo in comments

sunliming (2):
      drm/amdgpu: fix a missing break in gfx_v11_0_handle_priv_fault
      drm/amdgpu: make gfx_v11_0_rlc_stop static

 drivers/gpu/drm/amd/amdgpu/Makefile                |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |      6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    439 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |      7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    265 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |     13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h            |      7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    143 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |     59 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes_ctx.h        |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |      4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |      6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     20 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |      6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     15 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     14 -
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h      |    307 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |     41 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |     34 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |      3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     13 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     48 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |      6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |      1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    112 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    555 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.h          |     28 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    126 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |      1 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |      6 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    109 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     19 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |     50 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |    563 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |     14 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     24 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     59 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |     12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |      2 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     21 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    134 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |     21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |     71 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    323 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |      4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    338 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |      8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |      3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     18 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    151 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |      6 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     21 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |      2 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    950 +-
 .../display/dc/bios/bios_parser_types_internal2.h  |      1 +
 .../gpu/drm/amd/display/dc/bios/command_table.c    |      4 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      2 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     34 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     17 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |     23 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |     12 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |     15 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h   |     60 +
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |     11 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |     12 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |     11 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |      2 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |      8 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |      9 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |      8 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |      3 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |      8 +
 .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h  |     65 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    869 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h   |     39 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |    140 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |     47 +
 .../dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h       |     63 +
 .../amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h |    108 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    164 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |      2 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    137 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    462 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |     38 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |     45 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     52 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |      5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |     44 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |      5 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |     33 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |      5 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |      1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |      5 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     36 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     23 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |     45 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     27 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     15 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |      2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     64 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |      2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |     47 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |     33 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |      2 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    146 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |      6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |      5 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |      8 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |     29 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     34 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |      3 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |      2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |     25 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |     49 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |      1 -
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |      3 +
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |      6 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |     32 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |     35 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |     11 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |     16 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     61 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |     11 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |     14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |    147 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |      9 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |      8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    106 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |     16 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     10 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     24 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |      6 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |      2 -
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |      6 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |     45 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    303 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |    159 +
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    294 +
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |     60 +
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    461 +
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |    266 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c   |    164 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h   |     38 +
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.c   |     90 +
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.h   |     63 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    964 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    174 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    148 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |     69 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    960 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     66 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    156 +
 .../hw_translate_diag.c => dcn32/dcn32_init.h}     |     20 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c  |    239 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h  |    225 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |    810 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |    213 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    268 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |    254 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   4002 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |     88 +
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |     42 +
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |    199 +
 .../display/dc/dcn321/dcn321_dio_link_encoder.h    |     42 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   2335 +
 .../hw_factory_diag.c => dcn321/dcn321_resource.h} |     46 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |      7 +
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |      2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    110 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |      8 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |     40 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |     73 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |      2 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |     16 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   3824 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |     57 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   6253 +
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   1175 +
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |    616 +
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.h  |     70 +
 .../drm/amd/display/dc/dml/display_mode_enums.h    |     88 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     15 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    138 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    171 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    247 +-
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |     73 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |      4 +-
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |      8 +-
 .../amd/display/dc/gpio/dcn20/hw_translate_dcn20.c |     17 +-
 .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |     17 +-
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |     19 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |    255 +
 .../hw_factory_diag.h => dcn32/hw_factory_dcn32.h} |     13 +-
 .../amd/display/dc/gpio/dcn32/hw_translate_dcn32.c |    349 +
 .../hw_translate_dcn32.h}                          |     11 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     16 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     13 +-
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |      2 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     10 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      8 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     45 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     45 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |      3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |      6 -
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |      8 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     23 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |      2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |      5 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |      8 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      8 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |      2 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     11 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |      7 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |      6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |      7 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     10 +-
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |    432 +
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.h   |     35 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |     19 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      8 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    277 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     11 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |      3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    493 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    256 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     51 +-
 .../drm/amd/display/include/bios_parser_types.h    |     11 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     14 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |      2 +
 .../drm/amd/display/include/ddc_service_types.h    |      6 +
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |      2 +-
 .../drm/amd/display/include/link_service_types.h   |      3 +-
 .../drm/amd/display/modules/freesync/freesync.c    |      5 +
 .../amd/display/modules/hdcp/hdcp2_transition.c    |      2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |      4 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |     11 +
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |      3 +
 .../amd/display/modules/info_packet/info_packet.c  |     29 +-
 .../drm/amd/display/modules/power/power_helpers.c  |     84 +
 .../drm/amd/display/modules/power/power_helpers.h  |      6 +
 drivers/gpu/drm/amd/display/modules/vmid/vmid.c    |      2 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |      1 +
 .../gpu/drm/amd/include/asic_reg/dce/dce_11_0_d.h  |      1 +
 .../amd/include/asic_reg/dce/dce_11_0_sh_mask.h    |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_2_0_offset.h    |  14677 ++
 .../amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h   | 222893 ++++++++++++++++++
 .../amd/include/asic_reg/dcn/dcn_3_2_1_offset.h    |  14561 ++
 .../amd/include/asic_reg/dcn/dcn_3_2_1_sh_mask.h   |  56582 +++++
 .../include/asic_reg/mmhub/mmhub_3_0_1_offset.h    |   1769 +
 .../include/asic_reg/mmhub/mmhub_3_0_1_sh_mask.h   |   7483 +
 .../amd/include/asic_reg/nbio/nbio_4_3_0_offset.h  |      2 +
 .../amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h |      1 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |      4 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h |     10 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |    209 +-
 drivers/gpu/drm/amd/include/mes_api_def.h          |      2 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     43 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |     14 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |      2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |     31 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     12 +
 .../drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h  |      2 +-
 .../swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h  |     17 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |      6 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |     62 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |      2 +
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_7_pptable.h |      9 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h   |      9 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     23 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |      5 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_pptable.h   |     10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     10 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |      1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |      1 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     13 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |      9 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |      1 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     14 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     98 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     61 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     36 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     28 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     14 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     19 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |      1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     83 +-
 drivers/gpu/drm/radeon/.gitignore                  |      2 +-
 drivers/gpu/drm/radeon/Kconfig                     |      2 +-
 drivers/gpu/drm/radeon/Makefile                    |      2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |     14 -
 drivers/gpu/drm/radeon/ni_dpm.c                    |      6 +-
 drivers/gpu/drm/radeon/r300_reg.h                  |      2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |      2 -
 drivers/gpu/drm/radeon/radeon_gem.c                |      2 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |     15 -
 drivers/gpu/drm/radeon/radeon_mode.h               |      4 -
 drivers/gpu/drm/radeon/radeon_sa.c                 |      6 +-
 drivers/gpu/drm/scheduler/sched_main.c             |     13 +-
 include/linux/workqueue.h                          |      1 +
 include/uapi/drm/drm_fourcc.h                      |      6 +-
 include/uapi/linux/kfd_ioctl.h                     |     52 +-
 kernel/workqueue.c                                 |      9 +
 350 files changed, 354894 insertions(+), 2592 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
 rename drivers/gpu/drm/amd/display/dc/{gpio/diagnostics/hw_translate_diag.c => dcn32/dcn32_init.h} (74%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
 rename drivers/gpu/drm/amd/display/dc/{gpio/diagnostics/hw_factory_diag.c => dcn321/dcn321_resource.h} (53%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
 rename drivers/gpu/drm/amd/display/dc/gpio/{diagnostics/hw_factory_diag.h => dcn32/hw_factory_dcn32.h} (81%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_translate_dcn32.c
 rename drivers/gpu/drm/amd/display/dc/gpio/{diagnostics/hw_translate_diag.h => dcn32/hw_translate_dcn32.h} (82%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_1_sh_mask.h
