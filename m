Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0E84FF84
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 23:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF4D10FED2;
	Fri,  9 Feb 2024 22:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1htP5rYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC2110FED0;
 Fri,  9 Feb 2024 22:15:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eztW6YJqHYhOZlslyuaHyxut9DhKkXoPRFlnD/Y8ftlR4pDhslra+WQZ3Az4+3hvbcBnrN9tFwI6Klqz5oe29cf31vClrCVRF71tWWV4uNBTA59Vl66kp/nes71jEBDUQfjyNWNOS0ykBeHEI6Gh2I7K4C/G+dMiVjdl8zw2th/HuDd0xRGtJ9k3+NUGPFIOleS4o5FKAx1Q8rgOc+975k0X9zreiz7NWlq4hA9mfnFSFz2VRdL51jqITvyV9pYmsuBtzW3bSMGccpc75sMK6A4tmozutdgU+/RyZ+j5f5x5DeNhK08kIiAHhQZbJorOY+aawg7oNYOPe8qMll7ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZwixbM4BxCLlP0wCkgy+iCrimHepobGvCDaAmVZurQ=;
 b=iO5fB16ywDak16RSkCK7LXNFpIhAeAB1q73o6sl9VrknJ3O0WZkJxwZmU02U+m5nrVX0nr0iqMTs70tClosWuY+EYGpaHMv9YrgCjXxUm5oR+ToVKPCS3Wp8fvu5mw7VrHlxvpKEC/ThnwKZzPVN48EElBo5dKGefPlPofwu7g1wXe4i06jON+LU43TdmGXIAL8Alyb2TZTIHlQd3jMwfOZ1JJrEuet3pUprqMwJTh6ztBZCb6a2iePhgTOl0kRRimyca63q7tiyacJKcFzMZz5qF7dHR87t+YFKOpp1nrRfoDhe4NTAHuuO0IV/EE9aARUFupHZvXGGVg4qhxG/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZwixbM4BxCLlP0wCkgy+iCrimHepobGvCDaAmVZurQ=;
 b=1htP5rYw0kwQjVzAtvXQ/nvwdnFRy1OYPLzbsvi+m4jNLBl/Rjrgs3HSI6KcSvOqTzPs8NZh9WNS+1X6FNB3FKO1Kf6Hx5UXWryCu9HGfKE55IZERU9bJqqAr5FnkDUxB/idg8jzPOcEdew4Cep0SCJULAwE/O3COBgTreCNUh8=
Received: from BN7PR06CA0052.namprd06.prod.outlook.com (2603:10b6:408:34::29)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.11; Fri, 9 Feb
 2024 22:15:18 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:34:cafe::a1) by BN7PR06CA0052.outlook.office365.com
 (2603:10b6:408:34::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39 via Frontend
 Transport; Fri, 9 Feb 2024 22:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 9 Feb 2024 22:15:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 9 Feb
 2024 16:15:16 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.9
Date: Fri, 9 Feb 2024 17:14:58 -0500
Message-ID: <20240209221459.5453-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e975e6-d951-4e8f-ca81-08dc29bc9915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYGhr9mgahJ001kJXRcAHyJODULb3dhYy5lSPU2x8dVUHSaIiwKSN0sRJUvpwv+lejOPzKGCLAe9TZbUNWq9cLIxW08EJGs0p0J1oE5KjC9kJD4qLJ6varVrqOyuFzpWr797mHDvFANnLC95sI5Q2FxAS+OFI/i5H38jgVA+mCF35W4bCKfhk2qYzFqFE5aXsu2TiBym2amQ+muc5BXbySfbev6K3NkH2HDht0sGcRZFK3npJFHcNLOWf0KEARgz5N0jHowpmV5k0nX5Vrm9jrd7/ap6pk4fnUhjLNO+XipLxMKARY8x8X2JgMYdfan6DMNMc69+V9dMuiviMR5TwvoYlsK7E30M33YEENivL2GDKy1NQqwppXxGWY4PDelcDcx2U2CjrxFWyQstFT5Jsb6gQU1boWfckIIYcHz0GWQuYO+T/Bi3mqYcveVmf5UHt5aFPlvZcC5Z03T7+pjqnzCTIWhTy5/cutPH5x5Wc8YAmfpli8ihtUcDmUccLVk04iercdQXwvaOi528ucuIWpwJvERmU1LlPBL9aaMn2tvSqtGH53anJkLby54r64q95KWq2rRzVcJWwshGxFkcsu1f4VnKb2uDRI/UPqkSOrnXd6twg5UspgcC3T4JTTxi
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230273577357003)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(6666004)(966005)(7696005)(2906002)(316002)(5660300002)(110136005)(41300700001)(30864003)(8676002)(70586007)(70206006)(478600001)(4326008)(426003)(66574015)(336012)(8936002)(83380400001)(36756003)(86362001)(82740400003)(356005)(1076003)(26005)(2616005)(16526019)(81166007)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 22:15:17.8231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e975e6-d951-4e8f-ca81-08dc29bc9915
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

New stuff for 6.9.

The following changes since commit d7643fe6fb76edb1f2f1497bf5e8b8f4774b5129:

  drm/amd/display: Avoid enum conversion warning (2024-01-15 18:35:07 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.9-2024-02-09

for you to fetch changes up to d5597444032b2f5c8624918fb5b29be5bba78a3c:

  drm/amdgpu: Fix HDP flush for VFs on nbio v7.9 (2024-02-07 12:26:24 -0500)

----------------------------------------------------------------
amd-drm-next-6.9-2024-02-09:

amdgpu:
- Validate DMABuf imports in compute VMs
- Add RAS ACA framework
- PSP 13 fixes
- Misc code cleanups
- Replay fixes
- Atom interpretor PS, WS bounds checking
- DML2 fixes
- Audio fixes
- DCN 3.5 Z state fixes
- Remove deprecated ida_simple usage
- UBSAN fixes
- RAS fixes
- Enable seq64 infrastructure
- DC color block enablement
- Documentation updates
- DC documentation updates
- DMCUB updates
- S3 fixes
- VCN 4.0.5 fixes
- DP MST fixes
- SR-IOV fixes

amdkfd:
- Validate DMABuf imports in compute VMs
- SVM fixes
- Trap handler updates

radeon:
- Atom interpretor PS, WS bounds checking
- Misc code cleanups

UAPI:
- Bump KFD version so UMDs know that the fixes that enable the management of
  VA mappings in compute VMs using the GEM_VA ioctl for DMABufs exported from KFD are present
- Add INFO query for input power.  This matches the existing INFO query for average
  power.  Used in gaming HUDs, etc.
  Example userspace: https://github.com/Umio-Yasuno/libdrm-amdgpu-sys-rs/tree/input_power

----------------------------------------------------------------
Alex Deucher (8):
      drm/amdgpu: add new INFO IOCTL query for input power
      drm/amdgpu: move kiq_reg_write_reg_wait() out of amdgpu_virt.c
      drm/amdgpu/pptable: convert some variable sized arrays to [] style
      drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
      drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs
      drm/amdgpu: convert some variable sized arrays to [] style
      drm/amdgpu: update documentation on new chips
      drm/amdgpu: fix typo in parameter description

Alexander Richards (2):
      drm/amdgpu: check PS, WS index
      drm/radeon: check PS, WS index

Allen Pan (2):
      drm/amd/display: Add NULL-checks in dml2 assigned pipe search
      drm/amd/display: correct static screen event mask

Alvin Lee (6):
      drm/amd/display: Add Replay IPS register for DMUB command table
      drm/amd/display: Ensure populate uclk in bb construction
      drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel
      drm/amd/display: Populate invalid split index to be 0xF
      Revert "drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel"
      drm/amd/display: Update phantom pipe enable / disable sequence

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.201.0
      drm/amd/display: [FW Promotion] Release 0.0.202.0

Aric Cyr (5):
      drm/amd/display: Promote DAL to 3.2.268
      drm/amd/display: Promote DAL to 3.2.269
      drm/amd/display: Unify optimize_required flags and VRR adjustments
      drm/amd/display: 3.2.270
      drm/amd/display: 3.2.271

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Enable seq64 manager and fix bugs

Camille Cho (1):
      drm/amd/display: correct comment in set_default_brightness_aux()

Candice Li (3):
      drm/amdgpu: Do bad page retirement for deferred errors
      drm/amdgpu: Log deferred error separately
      drm/amd/pm: Retrieve UMC ODECC error count from aca bank

Charlene Liu (6):
      drm/amd/display: Add logging resource checks
      drm/amd/display: Update P010 scaling cap
      drm/amd/display: Revert "Rework DC Z10 restore"
      Revert "drm/amd/display: initialize all the dpm level's stutter latency"
      drm/amd/display: fix USB-C flag update after enc10 feature init
      drm/amd/display: fix DP audio settings

Christian König (1):
      drm/amdgpu: revert "Adjust removal control flow for smu v13_0_2"

Christophe JAILLET (2):
      drm/amd/display: Fix a switch statement in populate_dml_output_cfg_from_stream_state()
      drm/amdgpu: Remove usage of the deprecated ida_simple_xx() API

ChunTao Tso (1):
      drm/amd/display: Replay + IPS + ABM in Full Screen VPB

David McFarland (1):
      drm/amd: Don't init MEC2 firmware when it fails to load

Dillon Varone (1):
      drm/amd/display: Init link enc resources in dc_state only if res_pool presents

Dmytro Laktyushkin (2):
      drm/amd/display: Fix dml2 assigned pipe search
      drm/amd/display: Fix DPSTREAM CLK on and off sequence

Eric Yang (1):
      drm/amd/display: fix invalid reg access on DCN35 FPGA

Ethan Bitnun (2):
      drm/amd/display: Add delay before logging clks from hw
      drm/amd/display: Adjust set_p_state calls to fix logging

Fangzhi Zuo (2):
      drm/amd/display: Fix dcn35 8k30 Underflow/Corruption Issue
      drm/amd/display: Fix MST Null Ptr for RV

Felix Kuehling (3):
      drm/amdgpu: Auto-validate DMABuf imports in compute VMs
      drm/amdkfd: Bump KFD ioctl version
      drm/amdgpu: Remove unnecessary NULL check

Flora Cui (1):
      drm/amdkfd: init drm_client with funcs hook

Friedrich Vock (1):
      drm/amdgpu: Reset IH OVERFLOW_CLEAR bit

Fudongwang (2):
      drm/amd/display: Add GART memory support for dmcub
      drm/amd/display: refine code for dmcub inbox1 ring buffer debug

George Shen (3):
      drm/amd/display: Add DP audio BW validation
      drm/amd/display: Add debug option to force 1-tap chroma subsampling
      drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe split

GuoHua Chen (34):
      drm/radeon: Clean up errors in si_dpm.c
      drm/radeon/trinity_dpm: Clean up errors in trinity_dpm.c
      drm/radeon: Clean up errors in trinity_dpm.c
      drm/radeon: Clean up errors in radeon_atpx_handler.c
      drm/radeon/r100: Clean up errors in r100.c
      drm/radeon: Clean up errors in r600_dpm.h
      drm/radeon: Clean up errors in ni.c
      drm/radeon/dpm: Clean up errors in sumo_dpm.c
      drm/radeon/ni_dpm: Clean up errors in ni_dpm.c
      drm/radeon: Clean up errors in ni_dpm.c
      drm/radeon: Clean up errors in smu7_discrete.h
      drm/radeon/rv770: Clean up errors in rv770_dpm.c
      drm/radeon/dpm: Clean up errors in trinity_dpm.h
      drm/radeon/btc_dpm: Clean up errors in btc_dpm.c
      drm/radeon/kms: Clean up errors in rv6xx_dpm.h
      drm/radeon: Clean up errors in radeon_asic.c
      drm/radeon: Clean up errors in uvd_v1_0.c
      drm/radeon: Clean up errors in radeon_audio.h
      drm/radeon: Clean up errors in rs400.c
      drm/radeon: Clean up errors in radeon_audio.c
      drm/radeon: Clean up errors in si_dpm.h
      drm/radeon: Clean up errors in rs600.c
      drm/radeon: Clean up errors in r600.c
      drm/radeon/ci_dpm: Clean up errors in ci_dpm.c
      drm/radeon: Clean up errors in rv770_smc.h
      drm/radeon: Clean up errors in evergreen.c
      gpu/drm/radeon: Clean up errors in evergreen.c
      drm/radeon: Clean up errors in kv_smc.c
      drm/radeon: Clean up errors in evergreen_reg.h
      drm/radeon: Clean up errors in radeon_mode.h
      drm/radeon: Clean up errors in rv515.c
      drm/radeon: Clean up errors in r600_dpm.c
      drm/radeon/kms: Clean up errors in smu7_fusion.h
      drm/radeon/kms: Clean up errors in smu7.h

Hamza Mahfooz (1):
      drm/amd/display: add panel_power_savings sysfs entry to eDP connectors

Harry Wentland (1):
      drm/amd/display: Add dpp_get_gamut_remap functions

Hawking Zhang (11):
      drm/amdgpu: Replace DRM_* with dev_* in amdgpu_psp.c
      drm/amdgpu: drop psp v13 query_boot_status implementation
      drm/amdgpu: Init pcie_index/data address as fallback (v2)
      drm/amdgpu: Add ras helper to query boot errors v2
      drm/amdgpu: Query boot status if discovery failed
      drm/amdgpu: Query boot status if boot failed
      drm/amdgpu: Align ras block enum with firmware
      drm/amdgpu: Query ras capablity from psp v2
      drm/amdgpu: Centralize ras cap query to amdgpu_ras_check_supported
      drm/amdgpu: Fix null pointer dereference
      drm/amdgpu: Update boot time errors polling sequence

Hersen Wu (1):
      drm/amd/display: add debugfs disallow edp psr

Ilya Bakoulin (1):
      drm/amd/display: Clear OPTC mem select on disable

Jay Cornwall (1):
      drm/amdkfd: Use S_ENDPGM_SAVED in trap handler

Jiapeng Chong (1):
      drm/amd/display: Simplify the calculation of variables

Joseph Greathouse (1):
      drm/amdkfd: Add cache line sizes to KFD topology

Kenneth Feng (1):
      drm/amd/pm: update the power cap setting

Lang Yu (1):
      drm/amdkfd: reserve the BO before validating it

Le Ma (1):
      drm/amdgpu: move the drm client creation behind drm device registration

Leo (Hanghong) Ma (1):
      drm/amd/display: Fix timing bandwidth calculation for HDMI

Li Ma (1):
      drm/amdgpu: remove asymmetrical irq disabling in jpeg 4.0.5 suspend

Lijo Lazar (5):
      drm/amdgpu: Avoid fetching vram vendor information
      drm/amdgpu: Show vram vendor only if available
      drm/amd/pm: Fetch current power limit from FW
      drm/amdgpu: Avoid fetching VRAM vendor info
      drm/amdgpu: Fix HDP flush for VFs on nbio v7.9

Ma Jun (7):
      drm/amdgpu: Check extended configuration space register when system uses large bar
      drm/amdgpu: Fix the null pointer when load rlc firmware
      drm/amdgpu/pm: Fix the power source flag error
      drm/amdgpu/pm: Add default case for smu IH process func
      drm/amdgpu/pm: Use macro definitions in the smu IH process function
      drm/amdgpu: Fix the warning info in mode1 reset
      drm/amdgpu/pm: Use inline function for IP version check

Mario Limonciello (2):
      Revert "drm/amd/pm: fix the high voltage and temperature issue"
      drm/amd/display: Clear phantom stream count and plane count

Martin Leung (1):
      drm/amd/display: 3.2.267

Melissa Wen (8):
      drm/amd/display: decouple color state from hw state log
      drm/amd/display: read gamut remap matrix in fixed-point 31.32 format
      drm/amd/display: fill up DCN3 DPP color state
      drm/amd/display: add get_gamut_remap helper for MPC3
      drm/amd/display: create DCN3-specific log for MPC state
      drm/amd/display: hook up DCN30 color blocks data to DTN log
      drm/amd/display: add DPP and MPC color caps to DTN log
      drm/amd/display: hook up DCN20 color blocks data to DTN log

Michael Strauss (2):
      drm/amd/display: Remove Legacy FIXED_VS Transparent LT Sequence
      drm/amd/display: Don't perform rate toggle on DP2-capable FIXED_VS retimers

Mounika Adhuri (1):
      drm/amd/display: clkmgr unittest with removal of warn & rename DCN35 ips handshake for idle

Muhammad Ahmed (1):
      drm/amd/display: add power_state and pme_pending flag

Mukul Joshi (2):
      drm/amdgpu: Fix module unload hang with RAS enabled
      drm/amdkfd: Use correct drm device for cgroup permission check

Nathan Chancellor (1):
      drm/amd/display: Increase frame-larger-than for all display_mode_vba files

Nicholas Kazlauskas (11):
      drm/amd/display: Allow IPS2 during Replay
      drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A
      drm/amd/display: Rework DC Z10 restore
      drm/amd/display: Set default Z8 minimum residency for DCN35
      drm/amd/display: Allow Z8 for multiplane configurations on DCN35
      drm/amd/display: Wait before sending idle allow and after idle disallow
      drm/amd/display: Wait for mailbox ready when powering up DMCUB
      drm/amd/display: Add more checks for exiting idle in DC
      drm/amd/display: Disable timeout in more places for dc_dmub_srv
      drm/amd/display: Increase eval/entry delay for DCN35
      drm/amd/display: Disable idle reallow as part of command/gpint execution

Nicholas Susanto (1):
      drm/amd/display: Underflow workaround by increasing SR exit latency

Nikita Zhandarovich (2):
      drm/radeon: remove dead code in ni_mc_load_microcode()
      drm/radeon/ni_dpm: remove redundant NULL check

Ori Messinger (1):
      drm/amdgpu: Enable GFXOFF for Compute on GFX11

Ovidiu Bunea (1):
      drm/amd/display: Fix DML2 watermark calculation

Peichen Huang (1):
      drm/amd/display: Add usb4_bw_alloc_support flag

Philip Yang (1):
      drm/amdkfd: Correct partial migration virtual addr

Prike Liang (2):
      drm/amdgpu: skip to program GFXDEC registers for suspend abort
      drm/amdgpu: reset gpu for s3 suspend abort case

Qiang Ma (1):
      drm/amdgpu: Clear the hotplug interrupt ack bit before hpd initialization

Rodrigo Siqueira (13):
      Documentation/gpu: Add basic page for HUBP
      Documentation/gpu: Add simple doc page for DCHUBBUB
      drm/amd/include: Add missing registers/mask for DCN316 and 350
      Documentation/gpu: Add kernel doc entry for DPP
      Documentation/gpu: Add kernel doc entry for MPC
      Documentation/gpu: Add entry for OPP in the kernel doc
      Documentation/gpu: Add entry for the DIO component
      Documentation/gpu: Add an explanation about the DC weekly patches
      Documentation/gpu: Introduce a simple contribution list for display code
      drm/amd/display: Drop legacy code
      drm/amd/display: Disable ODM by default for DCN35
      drm/amd/display: Trivial code style adjustment
      drm/amd/display: Drop some unnecessary guards

Roman Li (4):
      drm/amd/display: Add IPS checks before dcn register access
      drm/amd/display: Disable ips before dc interrupt setting
      drm/amd: Add a DC debug mask for IPS
      drm/amd/display: "Enable IPS by default"

Samasth Norway Ananda (1):
      drm/amdgpu: fix wrong sizeof argument

Sohaib Nadeem (1):
      drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz

Srinivasan Shanmugam (17):
      drm/amdkfd: Fix variable dereferenced before NULL check in 'kfd_dbg_trap_device_snapshot()'
      drm/amd/display: Fix late derefrence 'dsc' check in 'link_set_dsc_pps_packet()'
      drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL check for writeback requests.
      drm/amdgpu: Cleanup inconsistent indenting in 'amdgpu_gfx_enable_kcq()'
      drm/amd/display: Drop kdoc markers for some Panel Replay functions
      drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions
      drm/amd/display: Address kdoc for eDP Panel Replay feature in 'amdgpu_dm_crtc_set_panel_sr_feature()'
      drm/amdgpu: Fix return type in 'aca_bank_hwip_is_matched()'
      drm/amd/display: Fix a potential buffer overflow in 'dp_dsc_clock_en_read()'
      drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
      drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'
      drm/amd/display: Add NULL check for kzalloc in 'amdgpu_dm_atomic_commit_tail()'
      drm/amd/display: Fix buffer overflow in 'get_host_router_total_dp_tunnel_bw()'
      drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
      drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'
      drm/amdgpu: Fix potential out-of-bounds access in 'amdgpu_discovery_reg_base_init()'
      drm/amd/display: Implement bounds check for stream encoder creation in DCN301

Stanley.Yang (4):
      drm/amdgpu: Show deferred error count for UMC
      drm/amdgpu: Skip do PCI error slot reset during RAS recovery
      drm/amdgpu: Fix ras features value calltrace
      drm/amdgpu: Fix shared buff copy to user

Taimur Hassan (1):
      drm/amd/display: Send DTBCLK disable message on first commit

Tao Zhou (6):
      drm/amdgpu: update error condition check for umc_v12_0_query_error_address
      Revert "drm/amd/pm: smu v13_0_6 supports ecc info by default"
      drm/amdgpu: update check condition of query for ras page retire
      drm/amdgpu: disable RAS feature when fini
      drm/amdgpu: add PSP RAS address query command
      drm/amdgpu: use PSP address query command

Tom Chung (1):
      drm/amd/display: Enable Panel Replay for static screen use case

Tom St Denis (1):
      drm/amd/amdgpu: Assign GART pages to AMD device mapping

Victor Skvortsov (2):
      drm/amdgpu: Add RAS_POISON_READY host response message
      amdgpu/drm: Use vram manager for virtualization page retirement

Wayne Lin (1):
      drm/amd/display: Align the returned error code with legacy DP

Wenjing Liu (5):
      drm/amd/display: Floor to mhz when requesting dpp disp clock changes to SMU
      drm/amd/display: turn off windowed Mpo ODM feature for dcn321
      drm/amd/display: fix incorrect mpc_combine array size
      drm/amd/display: use correct phantom pipe when populating subvp pipe info
      drm/amd/display: set odm_combine_policy based on context in dcn32 resource

XueBing Chen (9):
      drm/radeon/kms: Clean up errors in radeon_pm.c
      drm/radeon: Clean up errors in clearstate_ci.h
      drm/radeon: Clean up errors in clearstate_cayman.h
      drm/radeon/dpm: Clean up errors in evergreen_smc.h
      drm/radeon: Clean up errors in ci_dpm.h
      drm/radeon: Clean up errors in radeon.h
      drm/radeon: Clean up errors in si.c
      drm/radeon/evergreen_cs: Clean up errors in evergreen_cs.c
      drm/radeon/ni_dpm: Clean up errors in nislands_smc.h

Yang Wang (19):
      drm/amdgpu: implement RAS ACA driver framework
      drm/amdgpu: add ACA kernel hardware error log support
      drm/amdgpu: add ACA bank dump debugfs support
      drm/amd/pm: add aca smu backend support for smu v13.0.6
      drm/amdgpu: add amdgpu ras aca query interface
      drm/amdgpu: add aca sysfs support
      drm/amdgpu: add umc v12.0 ACA support
      drm/amdgpu: add gfx v9.4.3 ACA support
      drm/amdgpu: add sdma v4.4.2 ACA support
      drm/amdgpu: add mmhub v1.8 ACA support
      drm/amdgpu: add xgmi v6.4.0 ACA support
      drm/amdgpu: replace MCA macro with ACA for XGMI
      drm/amdgpu: fix UBSAN array-index-out-of-bounds for ras_block_string[]
      drm/amd/pm: enable amdgpu smu send message log
      drm/amd/pm: udpate smu v13.0.6 message permission
      drm/amdgpu: skip call ras_late_init if ras block is not supported
      drm/amdgpu: add aca sysfs remove support
      drm/amdgpu: adjust aca init/fini sequence to match gpu reset
      drm/amdgpu: use helper macro HW_ERR instead of Hardware error string

YiPeng Chai (7):
      drm/amdgpu: Add log info for umc_v12_0
      drm/amdgpu: Prepare for asynchronous processing of umc page retirement
      drm/amdgpu: Use asynchronous polling to handle umc_v12_0 poisoning
      drm/amdgpu: add interface to check mca umc status
      drm/amdgpu:Support retiring multiple MCA error address pages
      drm/amdgpu: Support passing poison consumption ras block to SRIOV
      drm/amdgpu: Need to resume ras during gpu reset for gfx v9_4_3 sriov

Yifan Zhang (2):
      drm/amdgpu: drm/amdgpu: remove golden setting for gfx 11.5.0
      drm/amdgpu: remove asymmetrical irq disabling in vcn 4.0.5 suspend

Yiling Chen (1):
      drm/amd/display: Fix static screen event mask definition change

YuanShang (1):
      drm/amd/amdgpu: Update RLC_SPM_MC_CNT by ring wreg in guest

chenxuebing (30):
      drm/amdgpu: Clean up errors in navi10_ih.c
      drm/amdgpu: Clean up errors in clearstate_gfx9.h
      drm/amdgpu: Clean up errors in amdgpu_atomfirmware.h
      drm/amd/amdgpu: Clean up errors in amdgpu_umr.h
      drm/amd: Clean up errors in sdma_v2_4.c
      drm/amdgpu: Clean up errors in amdgpu_rlc.c
      drm/amd: Clean up errors in amdgpu_vkms.c
      drm/amdgpu: Clean up errors in amdgpu_drv.c
      drm/amdgpu: Clean up errors in gfx_v9_4.c
      drm/amdgpu: Clean up errors in jpeg_v2_5.c
      drm/amdgpu: Clean up errors in amdgpu_gmc.c
      drm/amdgpu: Clean up errors in amdgpu.h
      drm/amdgpu: Clean up errors in clearstate_si.h
      drm/amdgpu: Clean up errors in umc_v6_0.c
      drm/amd/include: Clean up errors in arct_ip_offset.h
      drm/amdgpu: Clean up errors in atom-bits.h
      drm/amdgpu: Clean up errors in navi12_ip_offset.h
      drm/amdgpu: Clean up errors in kgd_pp_interface.h
      drm/amd/include/vega10_ip_offset:Clean up errors in vega10_ip_offset.h
      drm/amd: Clean up errors in vega10_ip_offset.h
      drm/amd/pp: Clean up errors in dm_pp_interface.h
      drm/amdgpu: Clean up errors in dimgrey_cavefish_ip_offset.h
      drm/amd/include/vangogh_ip_offset: Clean up errors in vangogh_ip_offset.h
      drm/amd/include/sienna_cichlid_ip_offset: Clean up errors in sienna_cichlid_ip_offset.h
      drm/amdgpu: Clean up errors in cgs_common.h
      drm/amd/include/navi14_ip_offset: Clean up errors in navi14_ip_offset.h
      drm/amdgpu: Clean up errors in v10_structs.h
      drm/amd/amdgpu: Clean up errors in beige_goby_ip_offset.h
      drm/amd/display: Clean up errors in renoir_ip_offset.h
      drm/amd/include/vega20_ip_offset: Clean up errors in vega20_ip_offset.h

shaoyunl (1):
      drm/amdgpu: Only create mes event log debugfs when mes is enabled

 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |   2 +
 Documentation/gpu/amdgpu/display/dcn-blocks.rst    |  78 ++
 .../gpu/amdgpu/display/display-contributing.rst    | 168 ++++
 .../gpu/amdgpu/display/display-manager.rst         |   3 -
 Documentation/gpu/amdgpu/display/index.rst         |  78 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            | 879 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            | 202 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  16 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  59 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 112 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |  33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 186 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 653 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |  70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h          |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            | 155 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/atom.c                  |  41 +-
 drivers/gpu/drm/amd/amdgpu/atom.h                  |   2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |  28 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  16 +-
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   6 +
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h       |  27 +-
 drivers/gpu/drm/amd/amdgpu/clearstate_si.h         |  24 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   5 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  22 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  22 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  21 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  40 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  92 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  23 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   6 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   7 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   9 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |  10 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |  87 ++
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  29 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   1 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  99 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  72 ++
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   6 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  22 +
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |  36 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   6 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             | 262 ++++--
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  17 -
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  19 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   6 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  14 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   2 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  93 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   3 +
 drivers/gpu/drm/amd/display/TODO                   | 110 ---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 182 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  72 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  55 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   5 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   | 119 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |   4 +-
 drivers/gpu/drm/amd/display/dc/basics/conversion.c |  34 +
 drivers/gpu/drm/amd/display/dc/basics/conversion.h |   4 +
 .../gpu/drm/amd/display/dc/bios/command_table.c    |   2 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   2 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |   4 -
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |   4 -
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   4 -
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  21 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |   6 -
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |   4 -
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |   4 -
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  42 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |   3 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  72 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |  15 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  76 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  58 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  18 +
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  11 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  31 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   5 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     | 293 ++++++-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |   3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |  20 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |   3 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c    |  70 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |   7 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |  31 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h   |   3 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |  55 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |  24 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |   1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  38 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |   2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |  54 ++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   | 106 ++-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |   4 +
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c   |   1 +
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  16 +-
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |  11 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  19 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   8 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  14 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  41 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  35 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   5 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  62 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |   4 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  97 ++-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 127 ++-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |   6 +
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |  63 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    | 167 +++-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |   6 +-
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  20 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.h    |   4 +
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |   2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  76 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |   2 +
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |   5 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  30 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   3 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   3 +
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |   9 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/audio.h      |   3 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |   6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  39 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |  15 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        | 257 ++++--
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |  16 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   2 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |  24 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |  10 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  18 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  66 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |   2 -
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   2 +-
 .../display/dc/link/protocols/link_dp_training.c   |   5 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         | 372 +--------
 .../link_dp_training_fixed_vs_pe_retimer.h         |   5 -
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |   4 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   3 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   3 +
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |  11 +
 .../display/dc/resource/dcn301/dcn301_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   2 -
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  16 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   9 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  16 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  77 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |   2 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    | 119 ++-
 drivers/gpu/drm/amd/display/include/audio_types.h  |  15 +
 .../drm/amd/display/modules/power/power_helpers.c  |   5 +
 .../drm/amd/display/modules/power/power_helpers.h  |   1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
 drivers/gpu/drm/amd/include/amdgpu_reg_state.h     |   2 +-
 drivers/gpu/drm/amd/include/arct_ip_offset.h       |   6 +-
 .../amd/include/asic_reg/dcn/dcn_3_1_6_offset.h    |   4 +
 .../amd/include/asic_reg/dcn/dcn_3_1_6_sh_mask.h   |  10 +
 .../amd/include/asic_reg/dcn/dcn_3_5_0_offset.h    |  24 +
 .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   |  65 ++
 drivers/gpu/drm/amd/include/atom-bits.h            |   2 +-
 drivers/gpu/drm/amd/include/beige_goby_ip_offset.h |   6 +-
 drivers/gpu/drm/amd/include/cgs_common.h           |  23 +-
 .../gpu/drm/amd/include/cyan_skillfish_ip_offset.h |   6 +-
 .../drm/amd/include/dimgrey_cavefish_ip_offset.h   |   6 +-
 drivers/gpu/drm/amd/include/dm_pp_interface.h      |   9 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   6 +-
 drivers/gpu/drm/amd/include/navi12_ip_offset.h     |   6 +-
 drivers/gpu/drm/amd/include/navi14_ip_offset.h     |   6 +-
 drivers/gpu/drm/amd/include/pptable.h              |   6 +-
 drivers/gpu/drm/amd/include/renoir_ip_offset.h     |   6 +-
 .../gpu/drm/amd/include/sienna_cichlid_ip_offset.h |   6 +-
 drivers/gpu/drm/amd/include/v10_structs.h          |   3 +-
 drivers/gpu/drm/amd/include/vangogh_ip_offset.h    |   6 +-
 drivers/gpu/drm/amd/include/vega10_ip_offset.h     |   6 +-
 drivers/gpu/drm/amd/include/vega20_ip_offset.h     |  78 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |  42 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c  |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  47 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  20 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  64 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 168 +++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  62 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  10 +
 drivers/gpu/drm/radeon/atom-bits.h                 |   2 +-
 drivers/gpu/drm/radeon/atom.c                      |  47 +-
 drivers/gpu/drm/radeon/atom.h                      |   4 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |  28 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |   4 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |  38 +-
 drivers/gpu/drm/radeon/atombios_i2c.c              |   2 +-
 drivers/gpu/drm/radeon/btc_dpm.c                   |  90 +--
 drivers/gpu/drm/radeon/ci_dpm.c                    |  31 +-
 drivers/gpu/drm/radeon/ci_dpm.h                    |   6 +-
 drivers/gpu/drm/radeon/clearstate_cayman.h         |   9 +-
 drivers/gpu/drm/radeon/clearstate_ci.h             |   3 +-
 drivers/gpu/drm/radeon/evergreen.c                 |  20 +-
 drivers/gpu/drm/radeon/evergreen_cs.c              |   4 +-
 drivers/gpu/drm/radeon/evergreen_reg.h             |  10 +-
 drivers/gpu/drm/radeon/evergreen_smc.h             |   9 +-
 drivers/gpu/drm/radeon/kv_dpm.c                    |   9 +-
 drivers/gpu/drm/radeon/kv_smc.c                    |   2 +-
 drivers/gpu/drm/radeon/ni.c                        |  31 +-
 drivers/gpu/drm/radeon/ni_dpm.c                    |   3 -
 drivers/gpu/drm/radeon/ni_dpm.h                    |  12 +-
 drivers/gpu/drm/radeon/nislands_smc.h              |  51 +-
 drivers/gpu/drm/radeon/r100.c                      |   2 +-
 drivers/gpu/drm/radeon/r300_reg.h                  |   2 +-
 drivers/gpu/drm/radeon/r600.c                      |   3 +-
 drivers/gpu/drm/radeon/r600_dpm.c                  |   6 +-
 drivers/gpu/drm/radeon/r600_dpm.h                  |   3 +-
 drivers/gpu/drm/radeon/radeon.h                    |   6 +-
 drivers/gpu/drm/radeon/radeon_asic.c               |   8 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |  44 +-
 drivers/gpu/drm/radeon/radeon_atpx_handler.c       |  12 +-
 drivers/gpu/drm/radeon/radeon_audio.c              |  11 +-
 drivers/gpu/drm/radeon/radeon_audio.h              |   6 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |   9 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |   4 +-
 drivers/gpu/drm/radeon/rs400.c                     |   4 +-
 drivers/gpu/drm/radeon/rs600.c                     |   3 +-
 drivers/gpu/drm/radeon/rv515.c                     |   3 +-
 drivers/gpu/drm/radeon/rv6xx_dpm.h                 |   3 +-
 drivers/gpu/drm/radeon/rv770_dpm.c                 |   4 +-
 drivers/gpu/drm/radeon/rv770_smc.h                 |  27 +-
 drivers/gpu/drm/radeon/si.c                        |  63 +-
 drivers/gpu/drm/radeon/si_dpm.c                    | 132 ++--
 drivers/gpu/drm/radeon/si_dpm.h                    |  21 +-
 drivers/gpu/drm/radeon/smu7.h                      |   6 +-
 drivers/gpu/drm/radeon/smu7_discrete.h             |  51 +-
 drivers/gpu/drm/radeon/smu7_fusion.h               |  42 +-
 drivers/gpu/drm/radeon/sumo_dpm.c                  |  18 +-
 drivers/gpu/drm/radeon/trinity_dpm.c               |  22 +-
 drivers/gpu/drm/radeon/trinity_dpm.h               |   3 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c                  |   2 +-
 include/uapi/drm/amdgpu_drm.h                      |   2 +
 include/uapi/linux/kfd_ioctl.h                     |   3 +-
 342 files changed, 7272 insertions(+), 2907 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/dcn-blocks.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-contributing.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h
 delete mode 100644 drivers/gpu/drm/amd/display/TODO
