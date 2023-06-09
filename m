Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E172A1A1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E642D10E60A;
	Fri,  9 Jun 2023 17:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B6510E165;
 Fri,  9 Jun 2023 17:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9ETzOssEem5AnUGqAL4eqUaAT+JrTRhRmJAnLxBdtjGP6Aiw7hvLbZQ2xtO2HRnRLLU7woLwR08VhdLR7j5v0GA4gD9C8+U1EhKhnyyVaTAIrKgOcG86sEqkxjjCbz6Q1V2SoHKduxIcdi3KIAuqwA74p0JI5I3GoHYLlCPeL3p/s/EL9JMOQuGGELx4b3aVw3g4nAbCkBTWQ3QHOGcwlEqpPIOXY9ToeVRhZxgVtYJKsKNqsyMlfAiDVYJA4Pr97ncKeN6H2n90eBAAHkv+adSdnNUEwzsqlVCOWKNQ7cueOSHN1YrWxnJv+o603KYXGWw1FqheL1k5yNzx3EIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmvYuMJ+wWLsGokLwgijIXlULsiGOx9JW6l34qJjtLE=;
 b=W3g28pIQt5Clc611LaJAOuNsuWxkuiiXIGynEa8zNsR0SdX7Uu2X5W/3YSUeRpYs5I+AFHwaRSOIe58YujuTmgRvc+X+FFFVTOEqTstcwUlmnjLKVSPkmwjPqmNBuTpMLue7QbBaJ1fB5vWHU8irPY8/G87v24+KCKIhyUx4pavuRnwlqcDbvsf3yPNjoxPDxyl9PAmNkOPCFGkDYzyqZVAeweym4O2ziPAcRIvG+lRZ2jAisAlqINkKJCqnWqs812Z0lZ5Cbp+oudeRn6ld33MUO5ATwZWpALSYswlyXbYqb5p60+BaqaH77gAEBJptFdQuoy+CWQkdH1/ke4P60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmvYuMJ+wWLsGokLwgijIXlULsiGOx9JW6l34qJjtLE=;
 b=j/iUAJzBQBVbR1XANqHGc7WtSvtuAcYPponNpX/AEKMLQp4dDL4oLP0Nf74RZynwXh+J56/eVrMPnm7WXEtBAI8UiWWRyDxKlrnUN7EpHQi8SDT3v7TUjKDelDEHgIPd1FHnFqJ2vQz4jCke6QeyI63JxL3uB75DWUNNFsUGh1w=
Received: from BYAPR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:40::32)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Fri, 9 Jun
 2023 17:48:32 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:40:cafe::f4) by BYAPR04CA0019.outlook.office365.com
 (2603:10b6:a03:40::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 17:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.25 via Frontend Transport; Fri, 9 Jun 2023 17:48:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 12:48:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, ttm, drm, UAPI drm-next-6.5
Date: Fri, 9 Jun 2023 13:48:17 -0400
Message-ID: <20230609174817.7764-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed173a3-d107-47c4-ff6f-08db6911bd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hl03uXjoKzbx2mnEutFaH580lONoO+kp3d4H0KTi8WXD7ZKd2m5HJs9SY/vmof/fqlG9a7fIAK8VnITpwmbk+KMh3HVs2gKWVe2uWR+U/tqqcWwKPO5fmibe8yFAOLwu1dyHVR1boEhoj3+oQp4h3Bd4tu2muB0AW9B8LKUKXMfRCkt5m/Va80xwKPLtT0sCW0ml0Q32/dcDp69Prt70OLGfx4Nj7gbcQ5epBcc79OVCykhWgqD1dPHUQLEbx4RRx358r3T9HQxM6e25yAqoFhm3Gnd2qwNZqWrXzJwKSReT/Y8bAsXKpt93MtanvluvyT27NhK6z4y1dhzcFK6nXY9Wv9rCUdtkBvyzIZ3Wn3CxEO19vX9NaInUocFOnsJ9tsqwz/yYOKM++42BEbb7ITMyVfEBRGDjr2OkQLJ7k/Wy+7+z4v4C8OzylBBU6zwDXlqOtt1jhDF+/MwJ4vcbjEzC6dLFWh3KkWdPK0Enwz5UKQIaq1swZI2bvZD0cdQd6pNFn7AeaxSmMPucDpSL2oERQRPCQZ0YYBmuT9A7uDDLX0/vg0ZwPl6lNgUKXYYy3Ui5La4QaQ3dzOhWMAvTiadE9Clb/lZlCUcQfU2Rmjd4sMSuAEke7fO8IwBKUbayhq0cW+OM8r5/ElsikxgJXd+mBl1WPAU55tIEXibsncVokvkjzDgFyvQ+Fsa2Bk16UbcTfWfiYn82tHmvruVRdRcEhthbrFv9++CO5/SGek=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(1076003)(83380400001)(36756003)(26005)(40460700003)(336012)(426003)(66899021)(82310400005)(16526019)(40480700001)(2616005)(186003)(7696005)(6666004)(70586007)(70206006)(2906002)(30864003)(966005)(478600001)(41300700001)(316002)(36860700001)(8936002)(8676002)(5660300002)(4326008)(110136005)(82740400003)(81166007)(47076005)(356005)(66574015)(86362001)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:48:31.7639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed173a3-d107-47c4-ff6f-08db6911bd8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

New stuff for 6.5.  Includes last week's PR with fixed sob tag, plus a few
new things.

The following changes since commit e82c98f2ca439356d5595ba8c9cd782f993f6f8c:

  Merge tag 'amd-drm-next-6.4-2023-04-14' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-04-17 10:54:59 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.5-2023-06-09

for you to fetch changes up to 3b718dcaf163d17fe907ea098c8449e0cd6bc271:

  drm/amd/display: Filter out AC mode frequencies on DC mode systems (2023-06-09 12:50:55 -0400)

----------------------------------------------------------------
amd-drm-next-6.5-2023-06-02:

amdgpu:
- SR-IOV fixes
- Warning fixes
- Misc code cleanups and spelling fixes
- DCN 3.2 updates
- Improved DC FAMS support for better power management
- Improved DC SubVP support for better power management
- DCN 3.1.x fixes
- Max IB size query
- DC GPU reset fixes
- RAS updates
- DCN 3.0.x fixes
- S/G display fixes
- CP shadow buffer support
- Implement connector force callback
- Z8 power improvements
- PSP 13.0.10 vbflash support
- Mode2 reset fixes
- Store MQDs in VRAM to improve queue switch latency
- VCN 3.x fixes
- JPEG 3.x fixes
- Enable DC_FP on LoongArch
- GFXOFF fixes
- GC 9.4.3 partition support
- SDMA 4.4.2 partition support
- VCN/JPEG 4.0.3 partition support
- VCN 4.0.3 updates
- NBIO 7.9 updates
- GC 9.4.3 updates
- Take NUMA into account when allocating memory
- Handle NUMA for partitions
- SMU 13.0.6 updates
- GC 9.4.3 RAS updates
- Stop including unused swiotlb.h
- SMU 13.0.7 fixes
- Fix clock output ordering on some APUs
- Clean up DC FPGA code
- GFX9 preemption fixes
- Misc irq fixes
- S0ix fixes
- Add new DRM_AMDGPU_WERROR config parameter to help with CI
- PCIe fix for RDNA2
- kdoc fixes
- Documentation updates

amdkfd:
- Query TTM mem limit rather than hardcoding it
- GC 9.4.3 partition support
- Handle NUMA for partitions

radeon:
- Fix possible double free
- Stop including unused swiotlb.h
- Fix possible division by zero

ttm:
- Add query for TTM mem limit
- Add NUMA awareness to pools
- Export ttm_pool_fini()

UAPI:
- Add new ctx query flag to better handle GPU resets
  Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22290
- Add new interface to query and set shadow buffer for RDNA3
  Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21986
- Add new INFO query for max IB size
  Proposed userspace: https://gitlab.freedesktop.org/bnieuwenhuizen/mesa/-/commits/ib-rejection-v3

amd-drm-next-6.5-2023-06-09:

amdgpu:
- S0ix fixes
- Initial SMU13 Overdrive support
- kdoc fixes
- Misc clode cleanups
- Flexible array fixes
- Display OTG fixes
- SMU 13.0.6 updates
- Revert some broken clock counter updates
- Misc display fixes
- GFX9 preemption fixes
- Add support for newer EEPROM bad page table format
- Add missing radeon secondary id
- Add support for new colorspace KMS API
- CSA fix
- Stable pstate fixes for APUs
- make vbl interface admin only
- Handle PCI accelerator class

amdkfd:
- Add debugger support for gdb

radeon:
- Fix possible UAF

drm:
- Add Colorspace functionality

UAPI:
- Add debugger interface for enabling gdb
  Proposed userspace: https://github.com/ROCm-Developer-Tools/ROCdbgapi/tree/wip-dbgapi
- Add KMS colorspace API
  Discussion: https://lists.freedesktop.org/archives/dri-devel/2023-June/408128.html

----------------------------------------------------------------
Alan Liu (4):
      drm/amd/display: Fix in disabling secure display
      drm/amdgpu: Fix desktop freezed after gpu-reset
      drm/amd/display: Fix in secure display context creation
      drm/amd/display: Fix warning in disabling vblank irq

Alex Deucher (37):
      drm/amdgpu/gfx11: add FW version check for new CP GFX shadow feature
      drm/amdgpu/gfx11: check the CP FW version CP GFX shadow support
      drm/amdgpu/UAPI: add new CS chunk for GFX shadow buffers
      drm/amdgpu: don't require a job for cond_exec and shadow
      drm/amdgpu: add UAPI to query GFX shadow sizes
      drm/amdgpu: add gfx shadow callback
      drm/amdgpu: add get_gfx_shadow_info callback for gfx11
      drm/amdgpu: add support for new GFX shadow size query
      drm/amdgpu: bump driver version number for CP GFX shadow
      drm/amdgpu: track MQD size for gfx and compute
      drm/amdgpu: add debugfs interface for reading MQDs
      drm/amdgpu/gfx11: update gpu_clock_counter logic
      drm/amdgpu/gfx11: drop old bring up code
      drm/amdgpu/gfx10: drop old bring up code
      drm/amdgpu: add [en/dis]able_kgq() functions
      drm/amdgpu/gfx10: use generic [en/dis]able_kgq() helpers
      drm/amdgpu/gfx11: use generic [en/dis]able_kgq() helpers
      drm/amdgpu/gfx10: drop unused variable
      drm/amdgpu/gfx11: drop unused variable
      drm/amdgpu/gfx8: always restore kcq MQDs
      drm/amdgpu/gfx9: always restore kcq MQDs
      drm/amdgpu/gfx10: always restore kcq/kgq MQDs
      drm/amdgpu/gfx11: always restore kcq/kgq MQDs
      drm/amdgpu: put MQDs in VRAM
      drm/amdgpu: drop invalid IP revision
      drm/amdgpu: drop unused function
      drm/amdgpu/gmc11: implement get_vbios_fb_size()
      drm/amdgpu/gmc9: fix 64 bit division in partition code
      drm/amdgpu/vcn4: fix endian conversion
      drm/amdkfd: fix stack size in svm_range_validate_and_map
      drm/radeon: reintroduce radeon_dp_work_func content
      drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices
      amd/amdkfd: drop unused KFD_IOCTL_SVM_FLAG_UNCACHED flag
      Revert "drm/amdgpu: change the reference clock for raven/raven2"
      Revert "drm/amdgpu: Differentiate between Raven2 and Raven/Picasso according to revision id"
      Revert "drm/amdgpu: switch to golden tsc registers for raven/raven2"
      drm/amdgpu: add missing radeon secondary PCI ID

Alex Hung (3):
      drm/amd/display: allow edp updates for virtual signal
      drm/amd/display: fix a divided-by-zero error
      drm/amd/display: implement force function in amdgpu_dm_connector_funcs

Alex Sierra (3):
      drm/amdgpu: improve wait logic at fence polling
      drm/amdkfd: pass kfd_node ref to svm migration api
      drm/amdkfd: flag added to handle errors from svm validate and map

Alvin Lee (21):
      drm/amd/display: Only consider DISPCLK when using optimized boot path
      drm/amd/display: Reduce SubVP + DRR stretch margin
      drm/amd/display: Set watermarks set D equal to A
      drm/amd/display: Enable FPO + Vactive
      drm/amd/display: Update DTBCLK for DCN32
      drm/amd/display: Update FW feature caps struct
      drm/amd/display: Limit DCN32 8 channel or less parts to DPM1 for FPO
      drm/amd/display: Enable SubVP on PSR panels if single stream
      drm/amd/display: For no plane case set pstate support in validation
      drm/amd/display: Enable SubVP for high refresh rate displays
      drm/amd/display: Query GECC enable for SubVP disable
      drm/amd/display: Check Vactive for VRR active for FPO + Vactive
      drm/amd/display: Enforce 60us prefetch for 200Mhz DCFCLK modes
      drm/amd/display: Block SubVP high refresh when VRR active fixed
      drm/amd/display: Block SubVP on displays that have pixclk > 1800Mhz
      drm/amd/display: Only skip update for DCFCLK, UCLK, FCLK on overclock
      drm/amd/display: Update vactive margin and max vblank for fpo + vactive
      drm/amd/display: Make unbounded req update separate from dlg/ttu
      drm/amd/display: Apply 60us prefetch for DCFCLK <= 300Mhz
      drm/amd/display: Refactor fast update to use new HWSS build sequence
      drm/amd/display: Reduce sdp bw after urgent to 90%

Amber Lin (5):
      drm/amdgpu: Add kgd2kfd for GC 9.4.3
      drm/amdkfd: Set F8_MODE for gc_v9_4_3
      drm/amdgpu: Set XNACK per process on GC 9.4.3
      drm/amdgpu: Fix SWS on multi-XCD GPU
      amd/amdgpu: Set MTYPE_UC for access over PCIe

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.162.0
      drm/amd/display: [FW Promotion] Release 0.0.163.0
      drm/amd/display: [FW Promotion] Release 0.0.165.0

Aric Cyr (7):
      drm/amd/display: 3.2.231
      drm/amd/display: 3.2.232
      drm/amd/display: 3.2.233
      drm/amd/display: 3.2.234
      drm/amd/display: Promote DAL to 3.2.235
      drm/amd/display: 3.2.236
      drm/amd/display: 3.2.237

Arnd Bergmann (9):
      drm/amd/display: fix is_timing_changed() prototype
      drm/amd/display: dumb_abm_lcd: avoid missing-prototype warnings
      drm/amd/display: mark amdgpu_dm_connector_funcs_force static
      drm/amd/pm: mark irq functions as 'static'
      drm/amdkfd: mark local functions as static
      drm/amdgpu:mark aqua_vanjaram_reg_init.c function as static
      drm/amdgpu: use %pad format string for dma_addr_t
      drm/amdgpu: fix acpi build warnings
      drm/amd/display: avoid calling missing .resync_fifo_dccg_dio()

Asad Kamal (2):
      drm/amd/pm: Update hw mon attributes for GC version 9.4.3
      drm/amd/pm: Expose mem temperature for GC version 9.4.3

Asad kamal (6):
      drm/amdgpu: Remove SMU powergate message call for SDMA
      drm/amdgpu: Enable CG for IH v4.4.2
      drm/amd/pm: Update pmfw header files for SMU v13.0.6
      drm/amd/pm: Update gfx clock frequency for SMU v13.0.6
      drm/amd/pm: Update pmfw header files for SMU v13.0.6
      drm/amd/pm: Add ih for SMU v13.0.6 thermal throttling

Aurabindo Pillai (18):
      drm/amd/display: Fix hang when skipping modeset
      drm/amd/display: remove incorrect early return
      drm/amd/display: Fixes for dcn32_clk_mgr implementation
      drm/amd/display: Do not clear GPINT register when releasing DMUB from reset
      drm/amd/display: Update bounding box values for DCN321
      drm/amd/display: Set DRAM clock if retraining is required
      drm/amd/display: Add check for PState change in DCN32
      drm/amd/display: Add extra check for 444 16 format
      drm/amd/display: Add FAMS capability to DCN31
      drm/amd/display: Add FAMS related definitions and documenation for enum fields
      drm/amd/display: Program OTG vtotal min/max selectors unconditionally
      Revert "drm/amd/display: disable SubVP + DRR to prevent underflow"
      drm/amd/display: Fix artifacting on eDP panels when engaging freesync video mode
      drm/amd/display: improve the message printed when loading DC
      Revert "drm/amd/display: Only use ODM2:1 policy for high pixel rate displays"
      drm/amd/display: Program OTG vtotal min/max selectors unconditionally for DCN1+
      drm/amd/display: Only use ODM2:1 policy for high pixel rate displays
      Revert "Revert drm/amd/display: Enable Freesync Video Mode by default"

Austin Zheng (1):
      drm/amd/display: Filter out AC mode frequencies on DC mode systems

Bas Nieuwenhuizen (5):
      drm/amdgpu: Increase GFX6 graphics ring size.
      drm/amdgpu: Add a max ibs per submission limit.
      drm/amdgpu: Add support for querying the max ibs in a submission. (v3)
      drm/amdgpu/gfx10: Disable gfxoff before disabling powergating.
      drm/amdgpu: Validate VM ioctl flags.

Bob Zhou (1):
      drm/amdxcp: fix Makefile to build amdxcp module

Candice Li (1):
      drm/amdgpu: Drop pcie_bif ras check from fatal error handler

Charlene Liu (1):
      drm/amd/display: add NULL pointer check

Chia-I Wu (3):
      drm/amdgpu: add a missing lock for AMDGPU_SCHED
      amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
      drm/amdgpu: fix xclk freq on CHIP_STONEY

Chong Li (2):
      drm/amdgpu: release gpu full access after "amdgpu_device_ip_late_init"
      drm/amdgpu: add option params to enforce process isolation between graphics and compute

Christian König (2):
      drm/amdgpu: add gfx shadow CS IOCTL support
      drm/amdgpu: add gfx11 emit shadow callback

Christoph Hellwig (2):
      drm/amdgpu: stop including swiotlb.h
      drm/radeon: stop including swiotlb.h

Christophe JAILLET (2):
      drm/amd/display: Fix a test CalculatePrefetchSchedule()
      drm/amd/display: Fix a test dml32_rq_dlg_get_rq_reg()

Colin Ian King (2):
      drm/amd/pm: Fix spelling mistake "aquire" -> "acquire"
      drm/amdgpu: Fix a couple of spelling mistakes in info and debug messages

Cruise Hung (3):
      drm/amd/display: Reset OUTBOX0 r/w pointer on DMUB reset
      drm/amd/display: Fix DMUB debugging print issue
      drm/amd/display: Update correct DCN314 register header

Dan Carpenter (6):
      drm/amdgpu: unlock the correct lock in amdgpu_gfx_enable_kcq()
      drm/amdgpu: unlock on error in gfx_v9_4_3_kiq_resume()
      drm/amdgpu: release correct lock in amdgpu_gfx_enable_kgq()
      drm/amd/amdgpu: Fix up locking etc in amdgpu_debugfs_gprwave_ioctl()
      drm/amd/pm: Fix memory some memory corruption
      drm/amdkfd: potential error pointer dereference in ioctl

Daniel Miess (5):
      drm/amd/display: limit timing for single dimm memory
      drm/amd/display: Fix possible underflow for displays with large vblank
      drm/amd/display: Remove v_startup workaround for dcn3+
      drm/amd/display: Revert vblank change that causes null pointer crash
      drm/amd/display: Fix possible underflow for displays with large vblank

Daniil Dulov (1):
      drm/amdkfd: Fix potential deallocation of previously deallocated memory.

David Belanger (1):
      drm/amdkfd: EOP Removal - Handle size 0 correctly

David Francis (1):
      drm/amdgpu/bu: add mtype_local as a module parameter

Dillon Varone (1):
      drm/amd/display: add support for low bpc

Dmytro Laktyushkin (9):
      drm/amd/display: update max streams per surface
      drm/amd/display: add extra dc odm debug options
      drm/amd/display: set dcn315 lb bpp to 48
      drm/amd/display: Limit nv21 dst_y
      drm/amd/display: add pixel rate based CRB allocation support
      drm/amd/display: disable dcn315 pixel rate crb when scaling
      drm/amd/display: fix dcn315 pixel rate crb scaling check
      drm/amd/display: fix seamless odm transitions
      drm/amd/display: fix dcn315 single stream crb allocation

Emily Deng (1):
      drm/amdgpu/mmsch: Correct the definition for mmsch init header

Eric Yang (1):
      drm/amd/display: add mechanism to skip DCN init

Evan Quan (7):
      drm/amd/pm: fix possible power mode mismatch between driver and PMFW
      drm/amd/pm: add missing NotifyPowerSource message mapping for SMU13.0.7
      drm/amd/pm: conditionally disable pcie lane switching for some sienna_cichlid SKUs
      drm/amd/pm: update SMU13 header files for coming OD support
      drm/amd/pm: fulfill SMU13 OD settings init and restore
      drm/amd/pm: fulfill the OD support for SMU13.0.0
      drm/amd/pm: fulfill the OD support for SMU13.0.7

Fangzhi Zuo (1):
      drm/amd/display: Have Payload Properly Created After Resume

Felix Kuehling (4):
      drm/amdkfd: Don't trigger evictions unmapping dmabuf attachments
      drm/amdgpu: Allocate GART table in RAM for AMD APU
      drm/amdgpu: Fix per-BO MTYPE selection for GFXv9.4.3
      drm/amdgpu: Override MTYPE per page on GFXv9.4.3 APUs

GONG, Ruiqi (1):
      drm/amd/display: fix compilation error due to shifting negative value

Gabe Teeger (1):
      drm/amd/display: update extended blank for dcn314 onwards

Gavin Wan (4):
      drm/amdgpu: Add PSP supporting PSP 13.0.6 SRIOV ucode init.
      drm/amdgpu: Skip using MC FB Offset when APU flag is set for SRIOV.
      drm/amdgpu: Set memory partitions to 1 for SRIOV.
      drm/amdgpu: Checked if the pointer NULL before use it.

George Shen (1):
      drm/amd/display: Add w/a to disable DP dual mode on certain ports

Graham Sider (5):
      drm/amdgpu: Correct dGPU MTYPE settings for gfx943
      drm/amdgpu: Use legacy TLB flush for gfx943
      drm/amdgpu/bu: Add use_mtype_cc_wa module param
      drm/amdgpu/bu: update mtype_local parameter settings
      drm/amdkfd: Add new gfx_target_versions for GC 9.4.3

Guchun Chen (14):
      drm/amdgpu: fix a build warning by a typo in amdgpu_gfx.c
      drm/amdgpu: check correct allocated mqd_backup object after alloc
      drm/amdgpu: mark gfx_v9_4_3_disable_gpa_mode() static
      drm/amdgpu: drop redundant sched job cleanup when cs is aborted
      drm/amd/pm: parse pp_handle under appropriate conditions
      drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in suspend
      drm/amd/pm: avoid potential UBSAN issue on legacy asics
      drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling legacy gfx ras
      drm/amdgpu: skip disabling fence driver src_irqs when device is unplugged
      drm/amd/pm: resolve reboot exception for si oland
      drm/amdgpu/sdma: set sched.ready status after ring/IB test in sdma
      drm/amdgpu/gfx: set sched.ready status after ring/IB test in gfx
      drm/amdgpu: switch to unified amdgpu_ring_test_helper
      drm/amdgpu: keep irq count in amdgpu_irq_disable_all

Guilherme G. Piccoli (1):
      drm/amdgpu/gfx11: Adjust gfxoff before powergating on gfx11 as well

Gustavo A. R. Silva (1):
      drm/amdgpu/discovery: Replace fake flex-arrays with flexible-array members

Hamza Mahfooz (8):
      drm/amd/display: fix flickering caused by S/G mode
      drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
      drm/amd/display: drop redundant memset() in get_available_dsc_slices()
      drm/amd/display: drop unused function set_abm_event()
      drm/amd/display: drop unused count variable in create_eml_sink()
      drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
      drm/amd/display: mark dml31's UseMinimumDCFCLK() as noinline_for_stack
      drm/amd/display: mark dml314's UseMinimumDCFCLK() as noinline_for_stack

Harish Kasiviswanathan (2):
      drm/amd: fix compiler error to support older compilers
      drm/amdgpu: For GFX 9.4.3 APU fix vram_usage value

Harry Wentland (10):
      drm/connector: Convert DRM_MODE_COLORIMETRY to enum
      drm/connector: Pull out common create_colorspace_property code
      drm/connector: Use common colorspace_names array
      drm/connector: Print connector colorspace in state debugfs
      drm/connector: Allow drivers to pass list of supported colorspaces
      drm/amd/display: Always pass connector_state to stream validation
      drm/amd/display: Register Colorspace property for DP and HDMI
      drm/amd/display: Signal mode_changed if colorspace changed
      drm/amd/display: Send correct DP colorspace infopacket
      drm/amd/display: Add debugfs for testing output colorspace

Harshit Mogalapalli (2):
      drm/amd/display: Fix possible NULL dereference in dc_dmub_srv_cmd_run_list()
      drm/amdgpu: Fix unsigned comparison with zero in gmc_v9_0_process_interrupt()

Hawking Zhang (33):
      drm/amdgpu: introduce vmhub definition for multi-partition cases (v3)
      drm/amdgpu: add vcn v4_0_3 ip headers
      drm/amdgpu: support gc v9_4_3 ring_test running on all xcc
      drm/amdgpu: add new vram type for dgpu
      drm/amdgpu: init gfx_v9_4_3 external_rev_id
      drm/amdgpu: retire render backend setup from gfx_v9_4_3
      drm/amdgpu: add smuio v13_0_3 ip headers
      drm/amdgpu: init smuio funcs for smuio v13_0_3
      drm/amdgpu: Add common helper to query ras error (v2)
      drm/amdgpu: Add common helper to reset ras error
      drm/amdgpu: Add sdma v4_4_2 ras registers
      drm/amdgpu: Add query_ras_error_count for sdma v4_4_2
      drm/amdgpu: Add reset_ras_error_count for sdma v4_4_2
      drm/amdgpu: Initialize sdma v4_4_2 ras function
      drm/amdgpu: Add mmhub v1_8_0 ras err status registers
      drm/amdgpu: Add query_ras_error_count for mmhub v1_8
      drm/amdgpu: Add reset_ras_error_count for mmhub v1_8
      drm/amdgpu: Add query_ras_error_status for mmhub v1_8
      drm/amdgpu: Add reset_ras_error_status for mmhub v1_8
      drm/amdgpu: Initialize mmhub v1_8 ras function
      drm/amdgpu: Enable persistent edc harvesting in APP APU
      drm/amdgpu: Add vcn/jpeg ras err status registers
      drm/amdgpu: Add query_ras_error_count for vcn v4_0_3
      drm/amdgpu: Add reset_ras_error_count for vcn v4_0_3
      drm/amdgpu: Initialize vcn v4_0_3 ras function
      drm/amdgpu: Re-enable VCN RAS if DPG is enabled
      drm/amdgpu: Add query_ras_error_count for jpeg v4_0_3
      drm/amdgpu: Add reset_ras_error_count for jpeg v4_0_3
      drm/amdgpu: Initialize jpeg v4_0_3 ras function
      drm/amdgpu: Adjust the sequence to query ras error info
      drm/amdkfd: Fix null ptr access
      drm/amdgpu: Do not access members of xcp w/o check (v2)
      drm/amdgpu: Add gc v9_4_3 ras error status registers

Hersen Wu (5):
      drm/amd/display: fix memleak in aconnector->timing_requested
      drm/amd/display: fix access hdcp_workqueue assert
      drm/amd/display: Return error code on DSC atomic check failure
      drm/amd/display: assign edid_blob_ptr with edid from debugfs
      drm/amd/display: lower dp link training message level

Horace Chen (1):
      drm/amdgpu: disable SDMA WPTR_POLL_ENABLE for SR-IOV

Horatio Zhang (10):
      drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v11_0_hw_fini
      drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v10_0_hw_fini
      drm/amdgpu: drop gfx_v11_0_cp_ecc_error_irq_funcs
      drm/amdgpu: separate ras irq from vcn instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v4_0
      drm/amdgpu: separate ras irq from jpeg instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v4_0
      drm/amdgpu: fix Null pointer dereference error in amdgpu_device_recover_vram

Huacai Chen (1):
      drm/amdgpu/display: Enable DC_FP for LoongArch

Igor Kravchenko (1):
      drm/amd/display: Set min_width and min_height capability for DCN30

Ikshwaku Chauhan (1):
      drm/amdgpu: enable tmz by default for GC 11.0.1

Ilya Bakoulin (1):
      drm/amd/display: Workaround wrong HDR colorimetry with some receivers

Iswara Nagulendran (1):
      drm/amd/display: Adding support for VESA SCR

Jack Xiao (2):
      drm/amdgpu: fix memory leak in mes self test
      drm/amdgpu: fix S3 issue if MQD in VRAM

James Zhu (50):
      drm/amdgpu/: add more macro to support offset variant
      drm/amdgpu: add VCN4_0_3 firmware
      drm/amdgpu/jpeg: add jpeg support for VCN4_0_3
      drm/amdgpu/vcn: add vcn support for VCN4_0_3
      drm/amdgpu/jpeg: enable jpeg cg for VCN4_0_3
      drm/amdgpu/jpeg: enable jpeg pg for VCN4_0_3
      drm/amdgpu/vcn: enable vcn cg for VCN4_0_3
      drm/amdgpu/vcn: enable vcn pg for VCN4_0_3
      drm/amdgpu/vcn: enable vcn DPG mode for VCN4_0_3
      drm/amdgpu/jpeg: add multiple jpeg rings support
      drm/amdgpu/jpeg: add multiple jpeg rings support for vcn4_0_3
      drm/amdgpu/nbio: update vcn doorbell range
      drm/amdgpu/vcn: enable vcn doorbell for vcn4.0.3
      drm/amdgpu/jpeg: enable jpeg doorbell for jpeg4.0.3
      drm/amdgpu: fix vcn doorbell range setting
      drm/amdgpu/vcn: use vcn4 irqsrc header for VCN 4.0.3
      drm/amdgpu/vcn: update vcn header to support multiple AIDs
      drm/amdgpu/jpeg: update jpeg header to support multiple AIDs
      drm/amdgpu/vcn: update new doorbell map
      drm/amdgpu/vcn: update ucode setup
      drm/amdgpu/vcn: remove unused code
      drm/amdgpu/vcn: update amdgpu_fw_shared to amdgpu_vcn4_fw_shared
      drm/amdgpu/nbio: add vcn doorbell multiple AIDs support
      drm/amdgpu/jpeg: add JPEG multiple AIDs support
      drm/amdgpu/vcn: update clock gate setting for VCN 4.0.3
      drm/amdgpu/vcn: add vcn multiple AIDs support
      drm/amdgpu: increase MAX setting to hold more jpeg instances
      drm/amdgpu: add fwlog support on vcn_v4_0_3
      drm/amdgpu: add unified queue support on vcn_v4_0_3
      drm/amdgpu: enable indirect_sram mode on vcn_v4_0_3
      drm/amdgpu: enable vcn/jpeg on vcn_v4_0_3
      drm/amdgpu: vcn_v4_0_3 load vcn fw once for all AIDs
      drm/amdgpu: increase AMDGPU_MAX_HWIP_RINGS
      drm/amdgpu: add num_xcps return
      drm/amdgpu/vcn: use dummy register selects AID for VCN_RAM ucode
      drm/amdgpu: use physical AID index for ring name
      drm/amdgpu: support partition drm devices
      drm/amdgpu: find partition ID when open device
      drm/amdgpu: add partition ID track in ring
      drm/amdgpu: update header to support partition scheduling
      drm/amdgpu: add partition scheduler list update
      drm/amdgpu: keep amdgpu_ctx_mgr in ctx structure
      drm/amdgpu: add partition schedule for GC(9, 4, 3)
      drm/amdgpu: run partition schedule if it is supported
      drm/amdgpu: update ref_cnt before ctx free
      drm/amdgpu: use xcp partition ID for amdgpu_gem
      drm/jpeg: add init value for num_jpeg_rings
      drm/amdgpu: save/restore part of xcp drm_device fields
      drm/amdxcp: add platform device driver for amdxcp
      drm/amdgpu: use amdxcp platform device as spatial partition

Jane Jian (1):
      drm/amdgpu/vcn: fix mmsch ctx table size

Jasdeep Dhillon (1):
      drm/amd/display: Isolate remaining FPU code in DCN32

Jay Cornwall (1):
      drm/amdkfd: add debug trap enabled flag to tma

Jesse Zhang (2):
      drm/amdgpu: Differentiate between Raven2 and Raven/Picasso according to revision id
      drm/amdgpu: don't enable secure display on incompatible platforms

Jiadong Zhu (4):
      drm/amdgpu: Reset CP_VMID_PREEMPT after trailing fence signaled
      drm/amdgpu: Program gds backup address as zero if no gds allocated
      drm/amdgpu: Modify indirect buffer packages for resubmission
      drm/amdgpu: Implement gfx9 patch functions for resubmission

Jiapeng Chong (9):
      drm/amdgpu: remove unneeded semicolon
      drm/amdgpu: Remove the unused variable golden_settings_gc_9_4_3
      drm/amd/display: Simplify the calculation of variables
      drm/amdgpu: Remove duplicate include
      drm/amdgpu: Modify mismatched function name
      drm/amdgpu/vcn: Modify mismatched function name
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

JinZe.Xu (1):
      drm/amd/display: Restore rptr/wptr for DMCUB as workaround

Jingwen Zhu (1):
      drm/amd/display: Improvement for handling edp link training fails

Jonatas Esteves (1):
      drm/amd/pm: Fix output of pp_od_clk_voltage

Jonathan Kim (38):
      drm/amdkfd: add gpu compute cores io links for gfx9.4.3
      drm/amdgpu: reflect psp xgmi topology info for gfx9.4.3
      drm/amdkfd: bind cpu and hiveless gpu to a hive if xgmi connected
      drm/amdkfd: add debug and runtime enable interface
      drm/amdkfd: display debug capabilities
      drm/amdkfd: prepare per-process debug enable and disable
      drm/amdgpu: add kgd hw debug mode setting interface
      drm/amdgpu: setup hw debug registers on driver initialization
      drm/amdgpu: add gfx9 hw debug mode enable and disable calls
      drm/amdgpu: add gfx9.4.1 hw debug mode enable and disable calls
      drm/amdkfd: fix kfd_suspend_all_processes
      drm/amdgpu: add gfx10 hw debug mode enable and disable calls
      drm/amdgpu: add gfx9.4.2 hw debug mode enable and disable calls
      drm/amdgpu: add gfx11 hw debug mode enable and disable calls
      drm/amdgpu: add configurable grace period for unmap queues
      drm/amdkfd: prepare map process for single process debug devices
      drm/amdgpu: prepare map process for multi-process debug devices
      drm/amdgpu: expose debug api for mes
      drm/amdkfd: add per process hw trap enable and disable functions
      drm/amdkfd: apply trap workaround for gfx11
      drm/amdkfd: add raise exception event function
      drm/amdkfd: add send exception operation
      drm/amdkfd: add runtime enable operation
      drm/amdkfd: update process interrupt handling for debug events
      drm/amdkfd: add debug set exceptions enabled operation
      drm/amdkfd: add debug wave launch override operation
      drm/amdkfd: add debug wave launch mode operation
      drm/amdkfd: add debug suspend and resume process queues operation
      drm/amdkfd: add debug set and clear address watch points operation
      drm/amdkfd: add debug set flags operation
      drm/amdkfd: add debug query event operation
      drm/amdkfd: add debug query exception info operation
      drm/amdkfd: add debug queue snapshot operation
      drm/amdkfd: add debug device snapshot operation
      drm/amdkfd: bump kfd ioctl  minor version for debug api availability
      drm/amdgpu: fix debug wait on idle for gfx9.4.1
      drm/amdkfd: fix vmfault signalling with additional data.
      drm/amdkfd: fix and enable debugging for gfx11

Joshua Ashton (3):
      drm/connector: Add enum documentation to drm_colorspace
      drm/amd/display: Always set crtcinfo from create_stream_for_sink
      drm/amd/display: Refactor avi_info_frame colorimetry determination

Josip Pavic (5):
      drm/amd/display: copy dmub caps to dc on dcn31
      drm/amd/display: refactor dmub commands into single function
      drm/amd/display: drain dmub inbox if queue is full
      drm/amd/display: add option to use custom backlight caps
      drm/amd/display: cache trace buffer size

Kenneth Feng (2):
      drm/amd/pm: update smu-driver if header for smu 13.0.0 and smu 13.0.10
      drm/amd/pm: workaround for compute workload type on some skus

Krunoslav Kovac (1):
      drm/amd/display: 3-plane MPO enablement for DCN321

Lang Yu (2):
      drm/amdgpu: install stub fence into potential unused fence pointers
      drm/amdgpu: unmap and remove csa_va properly

Le Ma (51):
      drm/amdgpu: convert gfx.kiq to array type (v3)
      drm/amdgpu: move queue_bitmap to an independent structure (v3)
      drm/amdgpu: separate the mqd_backup for kiq from kcq
      drm/amdgpu: add multi-xcc support to amdgpu_gfx interfaces (v4)
      drm/amdgpu: split gc v9_4_3 functionality from gc v9_0
      drm/amdgpu: add xcc index argument to soc15_grbm_select
      drm/amdgpu: add multi-XCC initial support in gfx_v9_4_3.c
      drm/amdgpu: add xcc index argument to gfx v9_4_3 functions
      drm/amdgpu: add xcc index argument to select_sh_se function v2
      drm/amdgpu: add xcc index argument to rlc safe_mode func (v4)
      drm/amdgpu: add master/slave check in init phase
      drm/amdgpu: initialize num_xcd to 1 for gfx v9_0
      drm/amdgpu: allocate doorbell index for multi-die case
      drm/amdgpu: do gfxhub init for all XCDs
      drm/amdgpu: assign register address for vmhub object on each XCD
      drm/amdgpu: add bitmask to iterate vmhubs
      drm/amdgpu: init vmhubs bitmask for GC 9.4.3
      drm/amdgpu: assign different AMDGPU_GFXHUB for rings on each xcc
      drm/amdgpu: add sysfs node for compute partition mode
      drm/amdgpu: add node_id to physical id conversion in EOP handler
      drm/amdgpu: assign the doorbell index in 1st page to sdma page queue
      drm/amdgpu: adjust some basic elements for multiple AID case
      drm/amdgpu: add support for SDMA on multiple AIDs
      drm/amdgpu: assign the doorbell index for sdma on non-AID0
      drm/amdgpu: do mmhub init for multiple AIDs
      drm/amdgpu: correct the vmhub reference for each XCD in gfxhub init
      drm/amdgpu: complement the IH node_id table for multiple AIDs
      drm/amdgpu: set mmhub bitmask for multiple AIDs
      drm/amdgpu: convert the doorbell_index to 2 dwords offset for kiq
      drm/amdgpu: program GRBM_MCM_ADDR for non-AID0 GRBM
      drm/amdgpu: introduce new doorbell assignment table for GC 9.4.3
      drm/amdgpu: add indirect r/w interface for smn address greater than 32bits
      drm/amdgpu: configure the doorbell settings for sdma on non-AID0
      drm/amdgpu: adjust s2a entry register for sdma doorbell trans decoding
      drm/amdgpu: drop redundant csb init for gfx943
      drm/amdgpu: add new doorbell assignment table for aqua_vanjaram
      drm/amdgpu: switch to aqua_vanjaram_doorbell_index_init
      drm/amdgpu: update ip discovery header to v4
      drm/amdgpu: increase DISCOVERY_TMR_SIZE
      drm/amdgpu: extend max instances
      drm/amdgpu: do some register access cleanup in nbio v7_9
      drm/amdgpu: upgrade amdgpu_discovery struct ip to ip_v4
      drm/amdgpu: parse base address from new ip discovery with 64bit ip base address
      drm/amdgpu: add helpers to access registers on different AIDs
      drm/amdgpu: consolidate the access helpers in nbio v7_9
      drm/amdgpu: fix vm context register assignment in mmhub v1.8
      drm/amdgpu: correct the vmhub index when page fault occurs
      drm/amdgpu: enable context empty interrupt on sdma v4.4.2
      drm/amdgpu: increase AMDGPU_MAX_RINGS
      drm/amdgpu: change the print level to warn for ip block disabled
      drm/amdgpu/pm: notify driver unloading to PMFW for SMU v13.0.6 dGPU

Leo (Hanghong) Ma (2):
      drm/amd/display: Update scaler recout data for visual confirm
      drm/amd/display: Add visual confirm color support for MCLK switch

Leo Chen (4):
      drm/amd/display: Lowering min Z8 residency time
      drm/amd/display: Change default Z8 watermark values
      drm/amd/display: Adding debug option to override Z8 watermark values
      drm/amd/display: Add symclk workaround during disable link output

Leo Ma (2):
      drm/amd/display: revert "Update scaler recout data for visual confirm"
      Revert "drm/amd/display: cache trace buffer size"

Leon Huang (2):
      drm/amd/display: Refactor ABM feature
      drm/amd/display: Fix ABM pipe/backlight issues when change backlight

Lijo Lazar (100):
      drm/amdgpu: Use the correct API to read register
      drm/amdgpu: Add some XCC programming
      drm/amdgpu: Add mode2 reset logic for v13.0.6
      drm/amdgpu: Use new atomfirmware init for GC 9.4.3
      drm/amdgpu: Change num_xcd to xcc_mask
      drm/amdgpu: Add map of logical to physical inst
      drm/amdgpu: Use instance lookup table for GC 9.4.3
      drm/amdgpu: Add mask for SDMA instances
      drm/amdgpu: Use instance table for sdma 4.4.2
      drm/amdgpu: Fix GRBM programming sequence
      drm/amdgpu: Conform to SET_UCONFIG_REG spec
      drm/amdgpu: Use status register for partition mode
      drm/amdgpu: Fix programming of initial XCP mode
      drm/amdgpu: Fix register access on GC v9.4.3
      drm/amdgpu: Add IP instance map for aqua vanjaram
      drm/amdgpu: Add mask for SDMA instances
      drm/amdgpu: Use SDMA instance table for aqua vanjaram
      drm/amdgpu: Fix interrupt handling in GFX v9.4.3
      drm/amdgpu: Add SDMA v4.4.2 golden settings
      drm/amdgpu: Revert programming of CP_PSP_XCP_CTL
      drm/amdgpu: Skip runtime db read for PSP 13.0.6
      drm/amdgpu: Rename xcc specific functions
      drm/amdgpu: Add xcc specific functions
      drm/amdgpu: Add xcc specific functions for gfxhub
      drm/amdgpu: Add sdma instance specific functions
      drm/amdgpu: Add initial version of XCP routines
      drm/amdgpu: Add SOC partition funcs for GC v9.4.3
      drm/amdgpu: Add soc config init for GC9.4.3 ASICs
      drm/amdgpu: Switch to SOC partition funcs
      drm/amdgpu: Add GFXHUB v1.2 XCP funcs
      drm/amdgpu: Add SDMA v4.4.2 XCP funcs
      drm/amdgpu: Add XCP functions for GFX v9.4.3
      drm/amdgpu: Add XCP IP callback funcs for each IP
      drm/amdgpu: Skip TMR allocation if not required
      drm/amdgpu: Move generic logic to soc config
      drm/amdgpu: Derive active clusters from SDMA
      drm/amdgpu: Use mask for active clusters
      drm/amdgpu: Remove unnecessary return value check
      drm/amdgpu: Fix semaphore release
      drm/amdgpu: Fix GFX 9.4.3 dma address capability
      drm/amdgpu: Fix GFX v9.4.3 EOP buffer allocation
      drm/amdgpu: Add FGCG logic for GFX v9.4.3
      drm/amdgpu: Make VRAM discovery read optional
      drm/amdgpu: Use discovery to get XCC/SDMA mask
      drm/amdgpu: Populate VCN/JPEG harvest information
      drm/amdgpu: Keep SDMAv4.4.2 active during reset
      drm/amdgpu: Use unique doorbell range per xcc
      drm/amdgpu: Enable CGCG/LS for GC 9.4.3
      drm/amdgpu: Fix mqd init on GFX v9.4.3
      drm/amdgpu: Enable MGCG on SDMAv4.4.2
      drm/amd/pm: Keep interface version in PMFW header
      drm/amd/pm: Initialize power limit for SMU v13.0.6
      drm/amd/pm: Update PMFW headers for version 85.54
      drm/amd/pm: Notify PMFW about driver unload cases
      drm/amdgpu: Add mode-2 reset in SMU v13.0.6
      drm/amdgpu: Add flags for partition mode query
      drm/amdgpu: Use transient mode during xcp switch
      drm/amdgpu: Add FGCG for GFX v9.4.3
      drm/amdgpu: Add parsing of acpi xcc objects
      drm/amdgpu: Add API to get tmr info from acpi
      drm/amdgpu: Read discovery info from system memory
      drm/amdgpu: Add fallback path for discovery info
      drm/amdgpu: Fix discovery sys node harvest info
      drm/amdgpu: Add instance mask for VCN and JPEG
      drm/amdgpu: Add VCN logical to physical id mapping
      drm/amdgpu: Use logical ids for VCN/JPEG v4.0.3
      drm/amdgpu: Fix harvest reporting of VCN
      drm/amdgpu/vcn: Use buffer object's deletion logic
      drm/amdgpu: Simplify aquavanjram instance mapping
      drm/amdgpu: Use GPU VA space for IH v4.4.2 in APU
      drm/amdgpu: Use apt name for FW reserved region
      drm/amdgpu: Add utility functions for xcp
      drm/amdgpu: Move memory partition query to gmc
      drm/amdgpu: Get supported memory partition modes
      drm/amdgpu: Store additional numa node information
      drm/amdgpu: Add API to get numa information of XCC
      drm/amdgpu: Add memory partitions to gmc
      drm/amdgpu: Initialize memory ranges for GC 9.4.3
      drm/amdgpu: Add callback to fill xcp memory id
      drm/amdgpu: Fill xcp mem node in aquavanjaram
      drm/amdgpu: Move initialization of xcp before kfd
      drm/amdkfd: Add xcp reference to kfd node
      drm/amdkfd: Use xcc mask for identifying xcc
      drm/amdgpu: Check memory ranges for valid xcp mode
      drm/amdgpu: Add auto mode for compute partition
      drm/amdgpu: Fix unmapping of aperture
      drm/amdgpu: Add compute mode descriptor function
      drm/amdgpu: Return error on invalid compute mode
      drm/amdgpu: Add PSP spatial parition interface
      drm/amdgpu: Fix register accesses in GFX v9.4.3
      drm/amdgpu: Skip halting RLC on GFX v9.4.3
      drm/amdgpu: Disable interrupt tracker on NBIOv7.9
      drm/amdgpu: Fix warnings
      drm/amdgpu: Use single copy per SDMA instance type (v2)
      drm/amdkfd: Fix MEC pipe interrupt enablement
      drm/amdgpu: Initialize xcc mask
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Fix SMUv13.0.6 throttle status report
      drm/amd/pm: Fix power context allocation in SMU13
      drm/amd/pm: Fill metrics data for SMUv13.0.6

Likun Gao (3):
      drm/amdgpu: support psp vbflash sysfs for MP0 13_0_10
      drm/amdgpu: fix vga_set_state NULL pointer issue
      drm/amdgpu: retire set_vga_state for some ASIC

Lin.Cao (1):
      drm/amdgpu: Fix vram recover doesn't work after whole GPU reset (v2)

Longlong Yao (1):
      drm/amdgpu: fix calltrace warning in amddrm_buddy_fini

Mario Limonciello (10):
      drm/amd: Downgrade message about watermarks table after s0i3 to debug
      drm/amd: Update driver-misc.html for Phoenix
      drm/amd: Update driver-misc.html for Dragon Range
      drm/amd: Update driver-misc.html for Rembrandt-R
      drm/amd: Drop debugfs access to the DPCD
      drm/amd: Disallow s0ix without BIOS support again
      drm/amd: Make lack of `ACPI_FADT_LOW_POWER_S0` or `CONFIG_AMD_PMC` louder during suspend path
      drm/amd: Check that a system is a NUMA system before looking for SRAT
      drm/amd: Make sure image is written to trigger VBIOS image update flow
      drm/amd: Tighten permissions on VBIOS flashing attributes

Max Tseng (1):
      drm/amd/display: Add control flag to dc_stream_state to skip eDP BL off/link off

Meenakshikumar Somasundaram (1):
      drm/amd/display: Adjust dmub outbox notification enable

Michael Mityushkin (2):
      drm/amd/display: Correct output color space during HW reinitialize
      drm/amd/display: Apply correct panel mode when reinitializing hardware

Michael Strauss (2):
      drm/amd/display: Convert Delaying Aux-I Disable To Monitor Patch
      drm/amd/display: Keep disable aux-i delay as 0

Michel Dänzer (2):
      Revert "drm/amd/display: Block optimize on consecutive FAMS enables"
      Revert "drm/amd/display: Do not set drr on pipe commit"

Mikita Lipski (1):
      drm/amd/display: Write TEST_EDID_CHECKSUM_WRITE for EDID tests

Min Li (1):
      drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl

Mukul Joshi (35):
      drm/ttm: Helper function to get TTM mem limit
      drm/amdgpu: Set GTT size equal to TTM mem limit
      drm/amdkfd: Update KFD TTM mem limit
      drm/amdkfd: Introduce kfd_node struct (v5)
      drm/amdkfd: Add spatial partitioning support in KFD
      drm/amdkfd: Update MQD management on multi XCC setup
      drm/amdkfd: Add PM4 target XCC
      drm/amdkfd: Add XCC instance to kgd2kfd interface (v3)
      drm/amdgpu: Add XCC inst to PASID TLB flushing
      drm/amdkfd: Update context save handling for multi XCC setup (v2)
      drm/amdgpu: Fix VM fault reporting on XCC1
      drm/amdkfd: Call DQM stop during DQM uninitialize
      drm/amdkfd: Update sysfs node properties for multi XCC
      drm/amdkfd: Update SDMA queue management for GFX9.4.3
      drm/amdgpu: Fix CP_HYP_XCP_CTL register programming in CPX mode
      drm/amdkfd: Fix SDMA in CPX mode
      drm/amdkfd: Add SDMA info for SDMA 4.4.2
      drm/amdkfd: Populate memory info before adding GPU node to topology
      drm/amdkfd: Rework kfd_locked handling
      drm/amdkfd: Add device repartition support
      drm/amdkfd: Update SMI events for GFX9.4.3
      drm/amdkfd: Use instance table for GFX 9.4.3
      drm/amdgpu: Fix failure when switching to DPX mode
      drm/amdkfd: Update interrupt handling for GFX9.4.3
      drm/amdkfd: Update packet manager for GFX9.4.3
      drm/amdkfd: Setup current_logical_xcc_id in MQD
      drm/amdgpu: Increase Max GPU instance to 64
      drm/amdkfd: Enable SVM on Native mode
      drm/amdkfd: Increase queue number per process to 255 on GFX9.4.3
      drm/amdkfd: Move local_mem_info to kfd_node
      drm/amdkfd: Fix memory reporting on GFX 9.4.3
      drm/amdgpu: Enable IH CAM on GFX9.4.3
      drm/amdgpu: Add a low priority scheduler for VRAM clearing
      drm/amdkfd: Set event interrupt class for GFX 9.4.3
      drm/amdkfd: Fix reserved SDMA queues handling

Mustapha Ghaddar (1):
      drm/amd/display: enable dpia validate

Nasir Osman (1):
      drm/amd/display: DSC policy override when ODM combine is forced

Nathan Chancellor (2):
      drm/amdgpu: Fix return types of certain NBIOv7.9 callbacks
      drm/amdgpu: Wrap -Wunused-but-set-variable in cc-option

Nicholas Kazlauskas (2):
      drm/amd/display: Explicitly specify update type per plane info change
      drm/amd/display: Update SR watermarks for DCN314

Nikita Zhandarovich (2):
      radeon: avoid double free in ci_dpm_init()
      drm/radeon: fix possible division-by-zero errors

Philip Yang (24):
      drm/amdkfd: Optimize svm range map to GPU with XNACK on
      drm/amdgpu: more GPU page fault info for GC v9.4.3
      drm/amdkfd: Cleanup KFD nodes creation
      drm/amdkfd: Flush TLB after unmapping for GFX v9.4.3
      drm/amdgpu: Set TTM pools for memory partitions
      drm/amdkfd: Move pgmap to amdgpu_kfd_dev structure
      drm/amdgpu: Enable NPS4 CPX mode
      drm/amdgpu: Add xcp manager num_xcp_per_mem_partition
      drm/amdkfd: Store drm node minor number for kfd nodes
      drm/amdgpu: Add memory partition id to amdgpu_vm
      drm/amdkfd: Show KFD node memory partition info
      drm/amdgpu: Add memory partition mem_id to amdgpu_bo
      drm/amdkfd: Alloc memory of GPU support memory partition
      drm/amdkfd: SVM range allocation support memory partition
      drm/amdgpu: dGPU mode placement support memory partition
      drm/amdkfd: Update MTYPE for far memory partition
      drm/amdgpu: Alloc page table on correct memory partition
      drm/amdgpu: dGPU mode set VRAM range lpfn as exclusive
      drm/amdkfd: Store xcp partition id to amdgpu bo
      drm/amdgpu: KFD graphics interop support compute partition
      drm/amdkfd: APU mode set max svm range pages
      drm/amdkfd: Refactor migrate init to support partition switch
      drm/amdgpu: Correct get_xcp_mem_id calculation
      drm/amdkfd: Align partition memory size to page size

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: add new flag to AMDGPU_CTX_QUERY2

Po-Ting Chen (1):
      drm/amd/display: update GSP1 generic info packet for PSRSU

Qingqing Zhuo (1):
      drm/amd/display: Clean FPGA code in dc

Rajneesh Bhardwaj (14):
      drm/amdkfd: Update coherence settings for svm ranges
      drm/amdgpu: implement smuio v13_0_3 callbacks
      drm/amdgpu: detect current GPU memory partition mode
      drm/amdgpu: Check APU supports true APP mode
      drm/amdgpu: set MTYPE in PTE for GFXIP 9.4.3
      drm/amdgpu: Make UTCL2 snoop CPU caches
      drm/amdkfd: Report XGMI IOLINKs for GFXIP9.4.3
      drm/ttm: add NUMA node id to the pool
      drm/amdgpu: Handle VRAM dependencies on GFXIP9.4.3
      drm/amdgpu: Implement new dummy vram manager
      drm/amdgpu: Create VRAM BOs on GTT for GFXIP9.4.3
      drm/ttm: export ttm_pool_fini for cleanup
      drm/amdkfd: Native mode memory partition support
      drm/amdgpu: Fix xGMI access P2P mapping failure on GFXIP 9.4.3

Rodrigo Siqueira (13):
      drm/amd/display: Update bouding box values for DCN32
      drm/amd/display: Add missing mclk update
      drm/amd/display: Adjust code identation and other minor details
      drm/amd/display: Set maximum VStartup if is DCN201
      drm/amd/display: Set dp_rate to dm_dp_rate_na by default
      drm/amd/display: Remove wrong assignment of DP link rate
      drm/amd/display: Use pointer in the memcpy
      drm/amd/display: Add missing WA and MCLK validation
      drm/amd/display: Add FAMS validation before trying to use it
      drm/amd/display: Show the DCN/DCE version in the log
      drm/amd/display: Convert connector signal id to string
      drm/amd/display: Remove unnecessary variable
      drm/amd/display: Reorganize DCN30 Makefile

Saaem Rizvi (3):
      drm/amd/display: Trigger DIO FIFO resync on commit streams
      drm/amd/display: Trigger DIO FIFO resync on commit streams for DCN32
      drm/amd/display: Wrong index type for pipe iterator

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: Remove harvest checking for JPEG3

Samson Tam (3):
      drm/amd/display: Clear GPINT1 before taking DMCUB out of reset
      drm/amd/display: filter out invalid bits in pipe_fuses
      drm/amd/display: add ODM case when looking for first split pipe

Shane Xiao (1):
      drm/amdgpu: Enable doorbell selfring after resize FB BAR

Sherry Wang (1):
      drm/amd/display: correct DML calc error

Shiwu Zhang (19):
      drm/amdgpu: make the WREG32_SOC15_xx macro to support multi GC
      drm/amdgpu: override partition mode through module parameter
      drm/amdgpu: alloc vm inv engines for every vmhub
      drm/amdgpu: enable the ring and IB test for slave kcq
      drm/amdgpu: add the support of XGMI link for GC 9.4.3
      drm/amdgpu: fix kcq mqd_backup buffer double free for multi-XCD
      drm/amdgpu: remove partition attributes sys file for gfx_v9_4_3
      drm/amdgpu: Fix the KCQ hang when binding back
      drm/amdgpu: preserve the num_links in case of reflection
      drm/amdgpu: route ioctls on primary node of XCPs to primary device
      drm/amdgpu: add the smu_v13_0_6 and gfx_v9_4_3 ip block
      drm/amdgpu: fix the memory override in kiq ring struct
      drm/amdgpu: init the XCC_DOORBELL_FENCE regs
      drm/amdgpu: bypass bios dependent operations
      drm/amdgpu: golden settings for ASIC rev_id 0
      drm/amdgpu: complement the 4, 6 and 8 XCC cases
      drm/amdgpu: set the APU flag based on package type
      drm/amdgpu: add the accelerator pcie class
      drm/amdgpu: add the accelerator PCIe class

Sonny Jiang (6):
      drm/amdgpu: add vcn_4_0_3 codec query
      drm/amdgpu: Load vcn_v4_0_3 ucode during early_init
      drm/amdgpu: A workaround for JPEG_v4_0_3 ring test fail
      drm/amdgpu: fixes a JPEG get write/read pointer bug
      drm/amdgpu: Add a read after write DB_CTRL for vcn_v4_0_3
      drm/amdgpu: Use a different value than 0xDEADBEEF for jpeg ring test

Sridevi (1):
      drm/amd/display: DSC Programming Deltas

Srinivasan Shanmugam (54):
      drm/amd/display: Unconditionally print when DP sink power state fails
      drm/amd/display: Check & log if receiver supports MST, DSC & FEC.
      drm/amd/amdgpu: Fix spaces in array indexing and indentations in amdgpu_kms.c
      drm/amd/amdgpu: Fix style errors in amdgpu_drv.c & amdgpu_device.c
      drm/amd/display: Remove unused variables in dcn21_hwseq.c
      drm/amd/amdgpu: Fix style issues in amdgpu_discovery.c
      drm/amd/display: DSC passthrough is for DP-HDMI pcon (SST pcon)
      drm/amd/amdgpu: Fix style errors in amdgpu_display.c
      drm/amd/amdgpu: Simplify switch case statements in amdgpu_connectors.c
      drm/amd/amdgpu: Fix style problems in amdgpu_debugfs.c
      drm/amd/display: Add logging for eDP v1.4 supported sink rates
      drm/amd/amdgpu: Fix style problems in amdgpu_psp.c
      drm/amd/display: Add logging when DP link training Channel EQ is Successful
      drm/amd/amdgpu: Fix errors & warnings in amdgpu _bios, _cs, _dma_buf, _fence.c
      drm/amd/amdgpu: Fix warnings in amdgpu _object, _ring.c
      drm/amd/amdgpu: Fix errors & warnings in amdgpu_ttm.c
      drm/amd/amdgpu: Fix warnings in amdgpu_encoders.c
      drm/amd/amdgpu: Fix errors & warnings in amdgpu_vcn.c
      drm/amd/amdgpu: Fix errors & warnings in amdgpu _uvd, _vce.c
      drm/amdgpu: Fix warnings in amdgpu _sdma, _ucode.c
      drm/amdgpu: Fix uninitialized variable in gfx_v9_4_3_cp_resume
      drm/amd/amdgpu: Fix errors & warnings in mmhub_v1_8.c
      drm/amdgpu: Fix uninitalized variable in jpeg_v4_0_3_is_idle & jpeg_v4_0_3_wait_for_idle
      drm/amdgpu: Fix uninitalized variable in kgd2kfd_device_init
      drm/amdgpu: Fix unused amdgpu_acpi_get_numa_info function in amdgpu_acpi_get_node_id()
      drm/amdgpu: Fix uninitialized variable in gfxhub_v1_2_xcp_resume
      drm/amd/amdgpu: Fix warnings in amdgpu_irq.c
      drm/amdgpu: Fix defined but not used gfx9_cs_data in gfx_v9_4_3.c
      drm/amdgpu: Fix unused variable in amdgpu_gfx.c
      drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as __maybe_unused
      drm/amdgpu: Fix up kdoc in sdma_v4_4_2.c
      drm/amdgpu: Fix up kdoc in amdgpu_acpi.c
      drm/amdgpu: Fix up missing kdoc in sdma_v6_0.c
      drm/amdgpu: Fix create_dmamap_sg_bo kdoc warnings
      drm/amd/display: Add missing kdoc entries in update_planes_and_stream_adapter
      drm/amd/display: Fix up kdoc formats in dcn32_fpu.c
      drm/amdgpu: Fix missing parameter desc for 'xcc_id' in gfx_v7_0.c & amdgpu_rlc.c
      drm/amdgpu: Fix up missing kdoc parameter 'inst' in get_wave_count() & kgd_gfx_v9_get_cu_occupancy()
      drm/amdgpu: Fix up missing parameter in kdoc for 'inst' in gmc_ v7, v8, v9, v10, v11.c
      drm/amdgpu: Fix missing parameter desc for 'xcp_id' in amdgpu_amdkfd_reserve_mem_limit
      drm/amdgpu: Fix up missing parameters kdoc in svm_migrate_vma_to_ram
      drm/amd/display: Fix up kdoc formatting in dcn32_resource_helpers.c
      drm/amd/display: Fix up missing 'dc' & 'pipe_ctx' kdoc parameters in delay_cursor_until_vupdate()
      drm/amd/display: Correct kdoc formatting for DCN32_CRB_SEGMENT_SIZE_KB in dcn32_hubbub.c
      drm/amd/display: Fix up kdoc formatting in display_mode_vba.c
      drm/amdgpu: Fix up kdoc 'ring' parameter in sdma_v6_0_ring_pad_ib
      drm/amdgpu: Fix up kdoc in amdgpu_device.c
      drm/amdgpu: Add function parameter 'event' to kdoc in svm_range_evict()
      drm/amd/display: Drop unused DCN_BASE variable in dcn314_resource.c
      drm/amd/display: Fix dc/dcn20/dcn20_optc.c kdoc
      drm/amd/display: Address kdoc warnings in dcn30_fpu.c
      drm/amd/display: Add gnu_printf format attribute for snprintf_count()
      drm/amdgpu: Mark 'kgd_gfx_aldebaran_clear_address_watch' & 'kgd_gfx_v11_clear_address_watch' functions as static
      drm/amd/display: Fix unused variable ‘should_lock_all_pipes’

Stanley.Yang (11):
      drm/amdgpu: Add SDMA_UTCL1_WR_FIFO_SED field for sdma_v4_4_ras_field
      drm/amdgpu: fix sdma instance
      drm/amdgpu: pass xcc mask to ras ta
      drm/amdgpu: support check vcn jpeg block mask
      drm/amdgpu: convert vcn/jpeg logical mask to physical mask
      drm/amdgpu: Rename ras table version
      drm/amdgpu: Add RAS table v2.1 macro definition
      drm/amdgpu: Support setting EEPROM table version
      drm/amdgpu: Add support EEPROM table v2.1
      drm/amdgpu: Calculate EEPROM table ras info bytes sum
      drm/amdgpu: Set EEPROM ras info

Su Hui (2):
      drm/amdgpu: remove unnecessary (void*) conversions
      drm/radeon: Remove unnecessary (void*) conversions

Sui Jingfeng (1):
      drm/amdgpu: display/Kconfig: replace leading spaces with tab

Sukrut Bellary (2):
      drm:amd:amdgpu: Fix missing bo unlock in failure path
      drm:amd:amdgpu: Fix missing buffer object unlock in failure path

Sung Lee (2):
      drm/amd/display: Add p-state debugging
      drm/amd/display: Add additional pstate registers to HW state query

Tao Zhou (15):
      drm/amdgpu: convert logical instance mask to physical one
      drm/amdgpu: add instance mask for RAS inject
      drm/amdgpu: reorganize RAS injection flow
      drm/amdgpu: remove RAS GFX injection for gfx_v9_4/gfx_v9_4_2
      drm/amdgpu: add check for RAS instance mask
      drm/amdgpu: add GFX RAS common function
      drm/amdgpu: add RAS status query for gfx_v9_4_3
      drm/amdgpu: add RAS status reset for gfx_v9_4_3
      drm/amdgpu: add RAS definitions for GFX
      drm/amdgpu: add RAS error count definitions for gfx_v9_4_3
      drm/amdgpu: add RAS error count query for gfx_v9_4_3
      drm/amdgpu: add RAS error count reset for gfx_v9_4_3
      drm/amdgpu: add sq timeout status functions for gfx_v9_4_3
      drm/amdgpu: initialize RAS for gfx_v9_4_3
      drm/amdgpu: remove unused definition

Thong Thai (1):
      drm/amdgpu/nv: update VCN 3 max HEVC encoding resolution

Tianci Yin (1):
      drm/amd/display: Disable migration to ensure consistency of per-CPU variable

Tim Huang (8):
      drm/amd/pm: reverse mclk and fclk clocks levels for SMU v13.0.4
      drm/amd/pm: reverse mclk clocks levels for SMU v13.0.5
      drm/amd/pm: reverse mclk and fclk clocks levels for yellow carp
      drm/amd/pm: reverse mclk and fclk clocks levels for vangogh
      drm/amd/pm: reverse mclk and fclk clocks levels for renoir
      drm/amd/pm: fix vclk setting failed for SMU v13.0.4
      drm/amd/pm: enable vclk and dclk Pstates for SMU v13.0.4
      drm/amd/pm: enable more Pstates profile levels for SMU v13.0.4

Tom Rix (9):
      drm/amd/pm: change pmfw_decoded_link_width, speed variables to globals
      drm/amd/display: set variable dccg314_init storage-class-specifier to static
      drm/amd/display: remove unused variable oldest_index
      drm/amd/display: remove unused variables dispclk_delay_subtotal and dout
      drm/amd/display: set variable custom_backlight_curve0 storage-class-specifier to static
      drm/amd/display: return status of dmub_srv_get_fw_boot_status
      drm/amdgpu: remove unused variable num_xcc
      drm/amd/display: remove unused variables res_create_maximus_funcs and debug_defaults_diags
      drm/amdkfd: remove unused sq_int_priv variable

Tom St Denis (1):
      drm/amd/amdgpu: Update debugfs for XCC support (v3)

Tong Liu01 (1):
      drm/amdgpu: fix incorrect pcie_gen_mask in passthrough case

Wesley Chalmers (3):
      drm/amd/display: Do not set drr on pipe commit
      drm/amd/display: Block optimize on consecutive FAMS enables
      drm/amd/display: Add logging for display MALL refresh setting

Xiaogang Chen (1):
      drm/amdkfd: Fix an issue at userptr buffer validation process.

Xiaomeng Hou (1):
      drm/amdgpu: remove pasid_src field from IV entry

Yang Li (14):
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amdkfd: clean up one inconsistent indenting

Yang Wang (4):
      drm/amd/pm: fix wrong smu socclk value
      drm/amd/pm: add unique serial number support for smu_v13_0_6
      drm/amdgpu: disable virtual display support on APP device
      drm/amdgpu: skip to resume rlcg for gc 9.4.3 in vf side

YiPeng Chai (2):
      drm/amdgpu: perform mode2 reset for sdma fed error on gfx v11_0_3
      drm/amdgpu: change reserved vram info print

Yifan Zhang (2):
      drm/amdgpu: set gfx9 onwards APU atomics support to be true
      drm/amdgpu: change gfx 11.0.4 external_id range

YuBiao Wang (2):
      drm/amdgpu: Enable mcbp under sriov by default
      drm/amdgpu: set default num_kcq to 2 under sriov

YuanShang (1):
      drm/amdgpu: Remove IMU ucode in vf2pf

ZhenGuo Yin (1):
      drm/amdgpu: set finished fence error if job timedout

Zhongwei (1):
      drm/amd/display: fix dpms_off issue when disabling bios mode

hackyzh002 (2):
      drm/radeon: Fix integer overflow in radeon_cs_parser_init
      drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1

lyndonli (2):
      drm/amdgpu: Fix mode2 reset for sienna cichlid
      drm/amdgpu: Use the default reset when loading or reloading the driver

shikaguo (1):
      drm/amd/pm: enable more Pstates profile levels for yellow_carp

 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     4 +-
 drivers/gpu/drm/Makefile                           |     1 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    10 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   419 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    82 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    60 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   154 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   123 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |   384 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   325 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |    55 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   182 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   210 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   470 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |    68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   171 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   243 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   352 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   347 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   141 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   380 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   142 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |     6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    24 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    23 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   171 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   230 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   261 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   111 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |    60 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       |    15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   322 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h            |    36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    86 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    74 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   399 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   182 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     1 -
 .../gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c    |   661 ++
 drivers/gpu/drm/amd/amdgpu/cik.c                   |     4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     2 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   290 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   377 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |    14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |    33 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    51 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   114 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   342 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.h              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |    24 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    34 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  4313 +++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h            |     5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   850 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    12 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |    10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    56 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    68 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   616 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |    15 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    17 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    51 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    18 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    49 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  1074 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |    51 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    36 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    59 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   915 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   134 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    59 +-
 drivers/gpu/drm/amd/amdgpu/nvd.h                   |     5 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     9 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    36 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.c             |     4 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   477 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    19 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |     4 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     2 -
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.c         |   103 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   119 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |     6 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    69 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    39 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |     6 +
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    33 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |    40 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  1541 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h            |    29 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    21 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |     4 +-
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   460 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    88 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  1118 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |   123 +
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   481 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  1029 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    35 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   405 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |    29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   108 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |    64 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |    31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |     9 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    40 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |    17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |    14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |    32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   423 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |    19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    34 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |    86 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |    73 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   320 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   283 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    98 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   303 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   213 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    14 +-
 drivers/gpu/drm/amd/amdxcp/Makefile                |    25 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |   110 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.h        |    29 +
 drivers/gpu/drm/amd/display/Kconfig                |    19 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   243 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     4 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    31 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |     2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |     9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   164 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    31 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |     8 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    25 +-
 .../amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c |    20 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    10 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    58 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    22 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    73 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    17 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    36 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |     3 +
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    50 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    42 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    58 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |     2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    42 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    53 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    75 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   478 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   305 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    58 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    38 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    34 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   310 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    15 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     7 +
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |     1 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    90 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    11 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    10 +-
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |     2 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    38 -
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     8 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   258 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   252 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |    46 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |     4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    28 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |     5 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    30 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |     5 +
 .../amd/display/dc/dce112/dce112_hw_sequencer.c    |     3 -
 .../drm/amd/display/dc/dce112/dce112_resource.c    |     5 +
 .../amd/display/dc/dce120/dce120_hw_sequencer.c    |     3 -
 .../drm/amd/display/dc/dce120/dce120_resource.c    |     1 +
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |     2 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   157 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |     1 -
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    23 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    29 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |    28 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |    11 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   107 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |     5 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |    34 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    39 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |    83 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |     2 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_optc.c    |     7 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |     7 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    68 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     6 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    34 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    38 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    15 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    72 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    14 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    37 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |     2 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    34 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    30 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    29 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     8 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   123 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |     7 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |     4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    45 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    13 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |     5 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    98 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     4 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    10 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    58 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   164 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    45 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    21 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |     5 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    80 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     4 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |     1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   106 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    18 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |    74 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    64 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |     9 +
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |     6 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     5 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   244 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |     2 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    33 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |     6 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    70 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   246 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |     3 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    45 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    11 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    26 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |     6 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    34 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   404 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |     4 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    17 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |     1 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    20 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |     2 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   528 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     1 -
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     1 -
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     3 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    12 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    12 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |     4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     3 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   135 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     2 +
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |    83 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |     4 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   230 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     6 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |     3 +
 .../display/dc/link/protocols/link_dp_capability.c |    36 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |     2 +-
 .../display/dc/link/protocols/link_dp_training.c   |    22 +-
 .../dc/link/protocols/link_dp_training_128b_132b.c |    10 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |     4 +
 .../link_dp_training_fixed_vs_pe_retimer.c         |    23 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    30 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    18 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    40 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |     6 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.h  |     4 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |     2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.c |    62 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.h |    33 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    19 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |     3 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    47 +-
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |     2 +-
 drivers/gpu/drm/amd/display/include/signal_types.h |    29 +
 .../drm/amd/display/modules/freesync/freesync.c    |     4 -
 .../drm/amd/display/modules/power/power_helpers.c  |    47 +
 .../drm/amd/display/modules/power/power_helpers.h  |     3 +
 drivers/gpu/drm/amd/include/amd_shared.h           |     1 -
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |    14 +
 .../amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h    |    69 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |    10 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |     4 +
 .../amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h    |     4 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h  |   192 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h |  1112 ++
 .../include/asic_reg/mmhub/mmhub_1_8_0_offset.h    |    56 +-
 .../include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h   |   325 +-
 .../amd/include/asic_reg/nbio/nbio_7_9_0_offset.h  |     2 +
 .../amd/include/asic_reg/sdma/sdma_4_4_2_offset.h  |     4 +
 .../amd/include/asic_reg/sdma/sdma_4_4_2_sh_mask.h |    24 +
 .../include/asic_reg/smuio/smuio_13_0_3_offset.h   |   177 +
 .../include/asic_reg/smuio/smuio_13_0_3_sh_mask.h  |   428 +
 .../amd/include/asic_reg/vcn/vcn_4_0_3_offset.h    |  2332 ++++
 .../amd/include/asic_reg/vcn/vcn_4_0_3_sh_mask.h   | 10919 +++++++++++++++++++
 drivers/gpu/drm/amd/include/atomfirmware.h         |     1 +
 drivers/gpu/drm/amd/include/discovery.h            |    32 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    59 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    22 +-
 drivers/gpu/drm/amd/include/v9_structs.h           |    30 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    25 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    80 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h   |    16 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |     6 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |    29 -
 .../drm/amd/pm/powerplay/hwmgr/smu7_powertune.c    |    12 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_powertune.c  |    36 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    28 +-
 .../swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h  |     2 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    51 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |     2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h |     2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h |    15 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |    31 +-
 .../inc/pmfw_if/smu13_driver_if_yellow_carp.h      |     2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    17 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |     3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    18 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |    16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    20 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    92 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    59 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   522 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   100 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   396 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   490 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   147 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |     1 -
 drivers/gpu/drm/drm_atomic.c                       |     1 +
 drivers/gpu/drm/drm_connector.c                    |   189 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |     4 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |    28 +-
 drivers/gpu/drm/radeon/cypress_dpm.c               |     8 +-
 drivers/gpu/drm/radeon/ni_dpm.c                    |     8 +-
 drivers/gpu/drm/radeon/r100.c                      |     8 +-
 drivers/gpu/drm/radeon/r300.c                      |     2 +-
 drivers/gpu/drm/radeon/r420.c                      |     2 +-
 drivers/gpu/drm/radeon/r600.c                      |     2 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |     3 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |     2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |     6 +-
 drivers/gpu/drm/radeon/radeon_ib.c                 |     2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |    10 +
 drivers/gpu/drm/radeon/radeon_pm.c                 |     2 +-
 drivers/gpu/drm/radeon/radeon_ring.c               |     2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |     3 +-
 drivers/gpu/drm/radeon/rs400.c                     |     2 +-
 drivers/gpu/drm/radeon/rv515.c                     |     4 +-
 drivers/gpu/drm/radeon/rv740_dpm.c                 |     8 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |     2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |    14 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |     6 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |     2 +-
 include/drm/display/drm_dp.h                       |     5 +-
 include/drm/drm_connector.h                        |   129 +-
 include/drm/ttm/ttm_pool.h                         |     4 +-
 include/drm/ttm/ttm_tt.h                           |     2 +-
 include/linux/pci_ids.h                            |     3 +
 include/uapi/drm/amdgpu_drm.h                      |    22 +
 include/uapi/linux/kfd_ioctl.h                     |   671 +-
 include/uapi/linux/kfd_sysfs.h                     |    15 +
 501 files changed, 46272 insertions(+), 8300 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
 create mode 100644 drivers/gpu/drm/amd/amdxcp/Makefile
 create mode 100644 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c
 create mode 100644 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_3_sh_mask.h
