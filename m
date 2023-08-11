Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CB7779948
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 23:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F1A10E10E;
	Fri, 11 Aug 2023 21:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6610E10E;
 Fri, 11 Aug 2023 21:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX8IQu3btj/qmAcoFt99D9/G9RQOBCwDwk2JL/rapMGhvklu3zYpm4mmG0Hx/gyrXY1zNMzgwgUV44t8XlJU/JyuRUnrhGJb+OWoPS6W99HhUczNCjqNzyI0HyXIpHF0H3r8MKyMAD8tL5nkuWhl5EEX+aRARPpU9TDDLNNC+2TGY8RqYUza2YUu53Xl0XGvgmoesEDo5YwTnLmZaUyJcYzdP/nd8zA2s1cKGnAGeGSyy/Mqi8BEwzYFPCE8heuuON0j6Rq0IuvDvCTdtk1eYeSa1x0j/2PHb/I5PRLmm8D08DOfnvjEcHZl4+NIPgIGqVO2KGSJEms2KsTNr2CftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYerrvK0cc33YTqQQ7ILt5u2kCiI+dWpv6yAC7o+Yh0=;
 b=K+l9R66gA+S5ExpUhxN8l7gAOEl66Og3XZoJM6twyM28oOeCpNcTbecX/jnEeUHEd0UypBN66+RrHMSVgkeT1LRT8T19xtjOp17U22+uMDuhSmEdyB82QdGj8aooWy7VH8aQ0CcUfBLp/+FrAwVFbBKC18R1/MGmdU7UZE8wGsvZhLRIPUYiA5csSYYxcFfAuZaO52jn3ccLx/A1qx3y7BsxuHD/ZfPdsfKUiXP4yy62xjrkPJpnN17H+CvUQxxULvEj4qULRdeFUnFLx9OYNp7uzmh4ytJ3oPu0hPLJh2/B9IXwndjBK9H8ppX+Z+nqVu0UuDbp0IDGmw1dGKSjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYerrvK0cc33YTqQQ7ILt5u2kCiI+dWpv6yAC7o+Yh0=;
 b=nFuP0gW+O6FMciQ6hMMRASEk+OshIlHYSdJxUvsre+uv2U5UR00vUFQ5/cq0RZUICINUN0YfkzF481oS4fmV+QoBEVTsfODI5cwLNrEiXvAi2VnPapjQOwf7eSvdbCXkp1Sn02C24+0Wwl1LTajsHCP/UQowibean9wL0kMekYM=
Received: from DM6PR14CA0044.namprd14.prod.outlook.com (2603:10b6:5:18f::21)
 by DM6PR12MB5519.namprd12.prod.outlook.com (2603:10b6:5:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 21:16:13 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:18f:cafe::6e) by DM6PR14CA0044.outlook.office365.com
 (2603:10b6:5:18f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 21:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 11 Aug 2023 21:16:12 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 16:16:11 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, drm_buddy drm-next-6.6
Date: Fri, 11 Aug 2023 17:15:54 -0400
Message-ID: <20230811211554.7804-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|DM6PR12MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: 2391587f-b64a-4547-fa04-08db9ab030ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCzKbetIpk19nbs84mTogrndyFdMXkEE1V6QujHRtVyHoUKQ5eMS4sjio/VjeQKk935HjAZ/HIsOlTtrIADIIxX0VT66wIV40ZNQIBbrYN/RYCK7vljJJxGhWavo1fmRXm3Kj8UO/6bmDW49RUW8aaQqjf1ELth1qa+QehFGUZpEW8omGEJTfGEbbdcw+tvgfI6iVNOkBDikL73xF+9vO0U+TsYhDLF3njFpgeIgPYhjax5tOl/3UksOmJU/byTmNkvQqABbRuoS+zutIJBt0RkgeIJS/S1RrBzDqvIKhMFQ6HIDT4ekfFgfNrImJx4NZy+O5jQo/e8nq0mqCNu1QrdfiHhd0oAPY1DxRpkLiphsXnEZPPvzNiEkRsIcNPhUaXGCjwVSWfEIjEwtkAxA2A5A0mIgw/mopEylPMj3ZxhlOm0LXID8eWzovSqjD7NmkCjlgY4Vk8qQBH2m0y1V7VgA3FcLp80tIX1yCGklGT8XATHPPW6YMdp9sIJXIf92ypleFc8v5pnFOmkOIobQsUCjjEaJ8xVuYGLqOpjdbuAILk/R4mtXMYTDZ9e8X5rztHAGnwkwEC18RE0UBQydPq8j0bB/Eus6eWGDPei+t4WyYO4C+/tahQIyoj0npeIGxytLY9H1RD+0v+uWPp7jvp0ZirCIsbhV0U+nup2b5jyZW+FxTJy1MoNIBve8CsTZCDpfHWGXkqMTfBbqyLRN0P+7yOx6podRwxivX3dgWtwFu0T0m3Ho3ZC6yEFIkzIW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(1800799006)(186006)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(36756003)(478600001)(110136005)(81166007)(16526019)(356005)(2616005)(336012)(4326008)(70206006)(70586007)(82740400003)(316002)(41300700001)(8936002)(8676002)(36860700001)(6666004)(5660300002)(26005)(7696005)(40480700001)(47076005)(83380400001)(30864003)(966005)(2906002)(1076003)(40460700003)(86362001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 21:16:12.7918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2391587f-b64a-4547-fa04-08db9ab030ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5519
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

New stuff for 6.6.

The following changes since commit d9aa1da9a8cfb0387eb5703c15bd1f54421460ac:

  Merge tag 'drm-intel-gt-next-2023-08-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-07 13:49:25 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.6-2023-08-11

for you to fetch changes up to 6be2ad4f0073c541146caa66c5ae936c955a8224:

  drm/amdgpu: don't allow userspace to create a doorbell BO (2023-08-11 14:48:07 -0400)

----------------------------------------------------------------
amdgpu:
- SDMA 6.1.0 support
- SMU 13.x fixes
- PSP 13.x fixes
- HDP 6.1 support
- SMUIO 14.0 support
- IH 6.1 support
- Coding style cleanups
- Misc display fixes
- Initial Freesync panel replay support
- RAS fixes
- SDMA 5.2 MGCG updates
- SR-IOV fixes
- DCN3+ gamma fix
- Revert zpos properly until IGT regression is fixed
- NBIO 7.9 fixes
- Use TTM to manage the doorbell BAR
- Async flip fix
- DPIA tracing support
- DCN 3.x TMDS HDMI fixes
- FRU fixes

amdkfd:
- Coding style cleanups
- SVM fixes
- Trap handler fixes
- Convert older APUs to use dGPU path like newer APUs
- Drop IOMMUv2 path as it is no longer used

radeon:
- Coding style cleanups

drm buddy:
- Fix debugging output

UAPI:
- A new memory pool was added to amdgpu_drm.h since we converted doorbell BAR management to use TTM,
  but userspace is blocked from allocating from it at this point, so kind of not really anything new
  here per se

----------------------------------------------------------------
Alex Deucher (10):
      drm/amdgpu: add UAPI for allocating doorbell memory
      drm/amdgpu: accommodate DOMAIN/PL_DOORBELL
      drm/amdgpu: fix possible UAF in amdgpu_cs_pass1()
      drm/amdgpu/gfx11: only enable CP GFX shadowing on SR-IOV
      drm/amdkfd: ignore crat by default
      drm/amdkfd: disable IOMMUv2 support for KV/CZ
      drm/amdkfd: disable IOMMUv2 support for Raven
      drm/amdkfd: drop IOMMUv2 support
      drm/amdkfd: rename device_queue_manager_init_v10_navi10()
      drm/amdgpu: don't allow userspace to create a doorbell BO

Alex Sierra (1):
      drm/amdkfd: avoid unmap dma address when svm_ranges are split

Alvin Lee (2):
      drm/amd/display: Implement interface for notify cursor support change
      drm/amd/display: Use max memclk variable when setting max memclk

Aric Cyr (1):
      drm/amd/display: Promote DC to 2.3.245

Asad Kamal (2):
      drm/amdgpu: Add pcie usage callback to nbio
      drm/amdgpu: Add pci usage to nbio v7.9

Austin Zheng (2):
      drm/amd/display: Set Stream Update Flags in commit_state_no_check
      drm/amd/display: Use DTBCLK as refclk instead of DPREFCLK

Ben Li (2):
      drm/amdgpu: add ih 6.1 registers
      drm/amdgpu: add ih 6.1 support

Bhawanpreet Lakha (6):
      drm/amd/display: Add structs for Freesync Panel Replay
      drm/amd/display: Add Functions to enable Freesync Panel Replay
      drm/amd/display: Add Freesync Panel DM code
      drm/amd/display: Read replay data from sink
      drm/amd/display: Change HDCP update sequence for DM
      drm/amd/display: Get replay info from VSDB

Candice Li (1):
      drm/amdgpu: Extend poison mode check to SDMA/VCN/JPEG

Denis Arefev (1):
      drm/amd/display: Return value of function

Emily Deng (1):
      drm/amdgpu/irq: Move irq resume to the beginning

Evan Quan (1):
      drm/amd/pm: disable the SMU13 OD feature support temporarily

Fangzhi Zuo (1):
      drm/amd/display: Temporary Disable MST DP Colorspace Property

Hamza Mahfooz (1):
      drm/amd/display: ensure async flips are only accepted for fast updates

Hawking Zhang (4):
      drm/amdgpu: Only create err_count sysfs when hw_op is supported
      drm/amdgpu: Apply poison mode check to GFX IP only
      drm/amdgpu: Remove gfx v11_0_3 ras_late_init call
      drm/amdgpu: Issue ras enable_feature for gfx ip only

Jay Cornwall (3):
      drm/amdkfd: Sync trap handler binaries with source
      drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole
      drm/amdkfd: Sign-extend TMA address in trap handler

Joshua Aberback (1):
      drm/amd/display: Clean up flip pending timeout handling

Kenneth Feng (1):
      drm/amd/pm: correct the pcie width for smu 13.0.0

Leo Chen (3):
      drm/amd/display: Revert "drm/amd/display: Read down-spread percentage from lut to adjust dprefclk."
      drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN31
      drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN314

Lijo Lazar (7):
      drm/amdgpu: Match against exact bootloader status
      drm/amdgpu: Add pcie replay count callback to nbio
      drm/amdgpu: Add pci replay count to nbio v7.9
      drm/amdgpu: Use nbio callback for nv and soc21
      drm/amd/pm: Fix SMU v13.0.6 energy reporting
      drm/amdgpu: Report vbios version instead of PN
      drm/amdgpu: Add FRU sysfs nodes only if needed

Ma Jun (1):
      drm/buddy: Fix drm buddy info output format

Mario Limonciello (3):
      drm/amd: Disable S/G for APUs when 64GB or more host memory
      drm/amd/display: Don't show stack trace for missing eDP
      drm/amd/display: Fix a regression on Polaris cards

Martin Leung (1):
      drm/amd/display: Promote DAL to 3.2.246

Melissa Wen (1):
      drm/amd/display: check attr flag before set cursor degamma on DCN3+

Mike Hsieh (1):
      drm/amd/display: Add vendor Id for reference

Nicholas Choi (1):
      Revert "drm/amd/display: Implement zpos property"

Ori Messinger (1):
      drm/amdgpu: Report Missing MES Firmware Versions with Sysfs

Praful Swarnakar (2):
      drm/amdgpu: Fix style issues in amdgpu_debugfs.c
      drm/amdgpu: Fix style issues in amdgpu_psp.c

Prike Liang (6):
      drm/amdgpu/sdma6: initialize sdma 6.1.0
      drm/amdgpu/discovery: enable sdma6 for SDMA 6.1.0
      drm/amdgpu/discovery: add hdp 6.1.0 support
      drm/amdgpu/discovery: add smuio 14.0.0 support
      drm/amdgpu/discovery: add ih 6.1.0 support
      drm/amdgpu: enable SDMA MGCG for SDMA 5.2.x

Ran Sun (90):
      drm/amd/pm: Clean up errors in smu_v11_0.h
      drm/amd/pm: Clean up errors in smu_v13_0_7_ppt.c
      drm/amd/pm: Clean up errors in smu_v13_0.c
      drm/amd/pm: Clean up errors in aldebaran_ppt.c
      drm/amd/pm: Clean up errors in smu_v13_0_6_ppt.c
      drm/amd/pm: Clean up errors in smu_v13_0_5_ppt.c
      drm/amd: Clean up errors in smu_v13_0_5_ppt.c
      drm/amd/pm: Clean up errors in amdgpu_smu.c
      drm/amd/pm: Clean up errors in amd_powerplay.c
      drm/amd/pm: Clean up errors in vega10_baco.c
      drm/amd/pm: Clean up errors in vega12_hwmgr.c
      drm/amd/pm/powerplay/hwmgr/ppevvmath: Clean up errors in ppevvmath.h
      drm/amd/pm: Clean up errors in smu10_hwmgr.c
      drm/amd/pm: Clean up errors in fiji_baco.c
      drm/amd/pm: Clean up errors in vega10_powertune.c
      drm/amd/pm: Clean up errors in vega12_pptable.h
      drm/amd/pm: Clean up errors in vega12_baco.c
      drm/amdgpu: Clean up errors in smu7_powertune.c
      drm/amdgpu: Clean up errors in common_baco.c
      drm/amdgpu: Clean up errors in smu_helper.c
      drm/amdgpu: Clean up errors in ci_baco.c
      drm/amdgpu: Clean up errors in ppatomctrl.h
      drm/amd/pm: Clean up errors in vega10_pptable.h
      drm/amd: Clean up errors in smu7_hwmgr.c
      drm/amd: Clean up errors in pptable_v1_0.h
      drm/amd: Clean up errors in vega10_processpptables.c
      drm/amdgpu/powerplay: Clean up errors in smu_helper.h
      drm/amd/pm: Clean up errors in vega20_hwmgr.h
      drm/amdgpu: Clean up errors in vega20_baco.c
      drm/amdgpu/powerplay: Clean up errors in vega20_hwmgr.c
      gpu: amd: Clean up errors in ppatomfwctrl.h
      drm/amd/pm: Clean up errors in tonga_baco.c
      drm/amd/pm/powerplay/hwmgr/hwmgr: Clean up errors in hwmgr.c
      drm/amd/pm: Clean up errors in vega12_hwmgr.h
      drm/amd/pm: Clean up errors in vega20_pptable.h
      drm/amd/pm: Clean up errors in polaris_baco.c
      drm/amd/pm: Clean up errors in smu9_driver_if.h
      drm/amd/pm: Clean up errors in smu71.h
      drm/amd/pm: Clean up errors in smu7_fusion.h
      drm/amd/pm: Clean up errors in smu7.h
      drm/amd/pm: Clean up errors in pp_thermal.h
      drm/amd/pm: Clean up errors in hardwaremanager.h
      drm/amd/pm: Clean up errors in hwmgr.h
      drm/amd/pm: Clean up errors in smu73.h
      drm/amd/pm: Clean up errors in smu75.h
      drivers/amd/pm: Clean up errors in smu8_smumgr.h
      drm/amd/pm: Clean up errors in r600_dpm.h
      drm/amd/pm: Clean up errors in sislands_smc.h
      drm/amd/pm: Clean up errors in amdgpu_pm.c
      drm/amd/display: Clean up errors in color_gamma.c
      drm/amd/display: Clean up errors in ddc_regs.h
      drm/amd/dc: Clean up errors in hpd_regs.h
      drm/amd/display: Clean up errors in dce110_timing_generator.c
      drm/amd/display: Clean up errors in dce110_hw_sequencer.c
      drm/amd/display: Clean up errors in dce112_hw_sequencer.c
      drm/amd/display: Clean up errors in dcn315_smu.c
      drm/amd/display: Clean up errors in dcn316_clk_mgr.c
      drm/amd/display: Clean up errors in dcn316_smu.c
      drm/amd/display: Clean up errors in bios_parser2.c
      drm/amd/display: Clean up errors in dc_stream.c
      drm/amd/display: Clean up errors in dcn10_dpp_dscl.c
      drm/amd/display: Clean up errors in display_mode_vba_30.c
      drm/amd/display: Clean up errors in dce_clk_mgr.c
      drm/amdgpu: Clean up errors in cik_ih.c
      drm/amdgpu: Clean up errors in vce_v3_0.c
      drm/amdgpu: Clean up errors in amdgpu_psp.h
      drm/amdgpu: Clean up errors in ih_v6_0.c
      drm/amdgpu: Clean up errors in vega20_ih.c
      drm/amdgpu: Clean up errors in mmhub_v9_4.c
      drm/amdgpu/atomfirmware: Clean up errors in amdgpu_atomfirmware.c
      drm/amdgpu: Clean up errors in uvd_v7_0.c
      drm/jpeg: Clean up errors in jpeg_v2_0.c
      drm/amdgpu: Clean up errors in dce_v10_0.c
      drm/amdgpu: Clean up errors in mxgpu_nv.c
      drm/amdgpu/jpeg: Clean up errors in vcn_v1_0.c
      drm/amdgpu: Clean up errors in dce_v8_0.c
      drm/amdgpu: Clean up errors in soc21.c
      drm/amdgpu: Clean up errors in amdgpu_atombios.h
      drm/amdgpu: Clean up errors in mes_v11_0.c
      drm/amdgpu: Clean up errors in amdgpu_trace.h
      drm/amdgpu: Clean up errors in amdgpu_ring.h
      drm/amdgpu: Clean up errors in amdgpu_virt.c
      drm/amdgpu: Clean up errors in nv.c
      drm/amdgpu: Clean up errors in mxgpu_vi.c
      drm/amdgpu: Clean up errors in uvd_v3_1.c
      drm/amdgpu: Clean up errors in vcn_v4_0.c
      drm/amdgpu: Clean up errors in gfx_v7_0.c
      drm/amdgpu: Clean up errors in tonga_ih.c
      drm/amdgpu: Clean up errors in vcn_v3_0.c
      drm/amd/pm: Clean up errors in smu73_discrete.h

Ruan Jinjie (2):
      drm/amdgpu: Remove a lot of unnecessary ternary operators
      drm/amd/pm: Remove many unnecessary NULL values

Shashank Sharma (9):
      drm/amdgpu: don't modify num_doorbells for mes
      drm/amdgpu: initialize ttm for doorbells
      drm/amdgpu: create kernel doorbell pages
      drm/amdgpu: get absolute offset from doorbell index
      drm/amdgpu: use doorbell mgr for kfd kernel doorbells
      drm/amdgpu: use doorbell mgr for kfd process doorbells
      drm/amdgpu: remove unused functions and variables
      drm/amdgpu: use doorbell mgr for MES kernel doorbells
      drm/amdgpu: cleanup MES process level doorbells

Srinivasan Shanmugam (8):
      drm/amdgpu: Cleanup amdgpu/amdgpu_cgs.c
      drm/amdgpu: Sort the includes in amdgpu/amdgpu_drv.c
      Revert "drm/radeon: Prefer dev_* variant over printk"
      drm/amdgpu: Move vram, gtt & flash defines to amdgpu_ ttm & _psp.h
      drm/amdgpu: Clean up style problems in mmhub_v2_3.c
      Revert "drm/amdgpu: Prefer dev_* variant over printk in amdgpu_atpx_handler.c"
      drm/amdgpu: Prefer pr_err/_warn/_notice over printk in amdgpu_atpx_handler.c
      drm/amdgpu: Fix identation issues in 'kgd_gfx_v9_program_trap_handler_settings'

Stylon Wang (2):
      drm/amd/display: Add interface to enable DPIA trace
      drm/amd/display: Enable DPIA trace with DC debug mask

Taimur Hassan (2):
      drm/amd/display: Add symclk enable/disable during stream enable/disable
      drm/amd/display: Fix typo in enable and disable symclk_se

Tao Zhou (1):
      drm/amdgpu: add RAS fatal error handler for NBIO v7.9

Tim Huang (1):
      drm/amd/pm: skip the RLC stop when S0i3 suspend for SMU v13.0.4/11

Uros Bizjak (1):
      drm/amdgpu: Use local64_try_cmpxchg in amdgpu_perf_read

Wenjing Liu (8):
      drm/amd/display: fix a regression in blank pixel data caused by coding mistake
      drm/amd/display: support plane clip with zero recout size
      drm/amd/display: always acquire MPO pipe for every blending tree
      drm/amd/display: update add plane to context logic with a new algorithm
      drm/amd/display: adjust visual confirm dpp height offset to be 1/240 of v addressable
      drm/amd/display: do not treat clip_rect size change as a scaling change
      drm/amd/display: move idle pipe allocation logic into dcn specific layer
      drm/amd/display: rename acquire_idle_pipe_for_layer to acquire_free_pipe_as_sec_dpp_pipe

Wesley Chalmers (2):
      drm/amd/display: Fix a bug when searching for insert_above_mpcc
      drm/amd/display: Make mpc32 functions available to future DCNs

Yang Wang (3):
      drm/amd/pm: fix pp_dpm_sclk node not displaying correctly
      drm/amd/pm: fix variable dereferenced issue in amdgpu_device_attr_create()
      drm/amd/pm: update smu_v13_0_6 message vf flag

Zhigang Luo (2):
      drm/amdgpu: remove SRIOV VF FB location programming
      drm/amdgpu: init TA microcode for SRIOV VF when MP0 IP is 13.0.6

 drivers/gpu/drm/amd/amdgpu/Makefile                |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   10 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |   76 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  108 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |  109 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   89 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  148 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |    3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   30 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   37 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   34 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   28 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   16 -
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    6 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |  769 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.h               |   28 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   12 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  270 ++++++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   66 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   27 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   42 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    6 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |    1 -
 drivers/gpu/drm/amd/amdkfd/Makefile                |    4 -
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  793 +++++++--------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |    5 +
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   77 --
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   52 -
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   22 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    6 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_cik.c  |   81 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v10.c  |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_vi.c   |  133 +--
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  233 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   82 --
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   51 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |  356 -------
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h             |   84 --
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   56 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   61 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  111 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   81 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   14 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   12 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   80 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    9 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |  183 ++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |   46 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   32 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   32 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |    7 -
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |   26 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    6 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |   18 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  125 +--
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    5 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  589 +++++------
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    3 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   18 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   29 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    3 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   29 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   41 +
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c   |    2 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    6 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  303 ++++++
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   58 ++
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   11 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |   12 +-
 .../display/dc/dce110/dce110_timing_generator.c    |    4 +-
 .../amd/display/dc/dce112/dce112_hw_sequencer.c    |    2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |    5 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   25 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   15 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |    7 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   15 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |    7 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    3 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    3 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   15 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   16 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |    3 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   28 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |   61 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  188 ++--
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    8 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    2 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    2 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    6 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    4 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h     |   40 +-
 drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h     |   10 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   57 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   10 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   14 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   21 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    3 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    7 +
 .../display/dc/link/protocols/link_dp_capability.c |   10 +
 .../dc/link/protocols/link_edp_panel_control.c     |  165 ++++
 .../dc/link/protocols/link_edp_panel_control.h     |    8 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  430 +++++++++
 .../drm/amd/display/include/ddc_service_types.h    |    1 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |    5 +-
 .../drm/amd/display/modules/color/color_gamma.c    |    5 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    5 +
 .../drm/amd/display/modules/power/power_helpers.h  |    2 +
 .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h |    8 +
 .../amd/include/asic_reg/oss/osssys_6_1_0_offset.h |  279 ++++++
 .../include/asic_reg/oss/osssys_6_1_0_sh_mask.h    | 1019 ++++++++++++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   15 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   48 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h       |    3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h   |   63 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   16 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ci_baco.c   |   21 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c   |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c |   24 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c     |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/polaris_baco.c  |   30 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h    |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h  |    3 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h |   14 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |    3 +-
 .../drm/amd/pm/powerplay/hwmgr/processpptables.c   |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   30 +-
 .../drm/amd/pm/powerplay/hwmgr/smu7_powertune.c    |   15 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h    |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/tonga_baco.c    |   30 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_baco.c   |   26 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    9 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_powertune.c  |   89 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_pptable.h    |   18 +-
 .../pm/powerplay/hwmgr/vega10_processpptables.c    |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c   |   12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h  |    3 +-
 .../drm/amd/pm/powerplay/hwmgr/vega12_pptable.h    |   11 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |    7 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h  |    6 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_pptable.h    |   19 +-
 .../gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h |    3 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |    8 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/pp_thermal.h  |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h        |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h       |   22 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h       |   45 +-
 .../gpu/drm/amd/pm/powerplay/inc/smu73_discrete.h  |   73 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu75.h       |   12 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h |   42 +-
 .../gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h  |   20 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |    2 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |    2 +-
 .../drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   27 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   20 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   85 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    4 +-
 drivers/gpu/drm/drm_buddy.c                        |    8 +-
 drivers/gpu/drm/radeon/radeon_atpx_handler.c       |   12 +-
 include/uapi/drm/amdgpu_drm.h                      |    7 +-
 248 files changed, 6320 insertions(+), 3828 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_1.h
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_sh_mask.h
