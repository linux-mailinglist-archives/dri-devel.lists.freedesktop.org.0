Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D23A40215
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 22:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855D10EB3D;
	Fri, 21 Feb 2025 21:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r9dIeKAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373E710E155;
 Fri, 21 Feb 2025 21:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSDvfcM6lgSo4yu2tWe+6+C/r7KTd9MPyDOMJ6yUs07X2HOtsnMLWLRpCSslhCHjR5uMecaGSRH/29GpZPrS7J+x7yM/PvwDyBA7SruZW5LfQJEA2SucQp0Etl9Hb4PXVBdUHt16YpjBR3ZZzE30N1YzGPJar5rG6zGFsfwrNCH1qeiRhIRwP6sHPidXZipU2QdM/h8mpNodYXWa9VHnPJMrL71zcIa479o1xoCq/5zd7OBS6ZK/IzSBR3TlpdXAe4ETOCZk7Y1hLHhwWhHSNzMVT3qa/QeDQVPvJKFsjzF5yu1rc9D3yUTbn34litfE78XkmjChuWZzx3wZnV/nEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiVPh2sKI+kdA9GDJ2XIL0pldimpgZSFcgBRBvFnmJ8=;
 b=lYbwYjM62t1fc7PiphOkdWDgphL8RpenSR9DnCPIoFou2/ZzFMkOyTHID0QcCmjPyfnCeI+0uiWmVIZIWMNI2xLoYyfBOq8BVNtGu8LkTBnS9cm7xtE0eYxjGQrb03Ui8tYU50Se5fiZwGZkUGsRLxENkr0wKrrWk3nlNeSBFEoSvc8nYsgfq6acwfExTyGwvSNYBRAqARVihMh1PKNhNpRcfUZzt2L9pNV4opTuXV9+vFpGq1ihYF9PuaPP2aogFgwYNXgnUAbMhWnvB1DauE+yjFF2a4PjlH7YLunJnrcXnZM3LwmhvNFWgDTA9879OXbYaFNkcIsfKgjYhRruzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiVPh2sKI+kdA9GDJ2XIL0pldimpgZSFcgBRBvFnmJ8=;
 b=r9dIeKAUHB71n8QX4IfumVexGovHuAj52gZco5awqCUq2qERqQMwgcJR5xkFMKdLgVo4Oac/rFphPy8lZEWj/J5C/OLVh0/CkyPvPBUW7jrz7jOXOiyhYLjaWCQkUgfhzgvs9XRcui3Q8LTlvJlSCsxZrD9GgyiCZoPmXXHE2Mg=
Received: from BY3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:254::20)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 21:37:07 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::8a) by BY3PR05CA0015.outlook.office365.com
 (2603:10b6:a03:254::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Fri,
 21 Feb 2025 21:37:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Fri, 21 Feb 2025 21:37:05 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Feb
 2025 15:37:04 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, UAPI drm-next-6.15
Date: Fri, 21 Feb 2025 16:36:51 -0500
Message-ID: <20250221213651.4176031-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MN2PR12MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: a20a05b3-0de1-45d0-c845-08dd52bfe338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mtb79XlmpvnixWJWTai5V6OsMGjryk6SYRw9rpxhUtK0ozxbdNuLI8pps1Tn?=
 =?us-ascii?Q?UWqDm+PFjATZB5bq28E5Ox13dtwxKZtkyObxuduet4ggtoFnrKGA4KfQo66w?=
 =?us-ascii?Q?Zqi0hRqkUUfzDs3MyFuhi9JJlO/QMpdkmwiCrMIKdfzPcBZ4pgKJgb5UD9Em?=
 =?us-ascii?Q?QB49nOAAGfOxhhdhlFCJDA7yQRBJ0SraJ7wawXFNuBdHdneQYCRHGmNzXEuP?=
 =?us-ascii?Q?Ky7pmUeBEiAnx6EWhmQPk1whBWYxlX27Mv15wPN0V3RZLSQqTakOexuYT3gj?=
 =?us-ascii?Q?8y+ShmpIKZBf+Bjq+s6lBsqx3erWJrlQBFrJ/Zgy2c4uIMg5izAfHmi3hC3l?=
 =?us-ascii?Q?3WzxYDgovWkbs6hBQU51nINlf/6pf5GBrM4wjA2Vue8Jk1n9nc/lltd8VVvT?=
 =?us-ascii?Q?dlb+bj++rdH2KcxunMrDyRnoOPRoJJ+4nzUO2R0cJwG0CU8p7uVJeqK1Adae?=
 =?us-ascii?Q?tO2hrfGioLVymeECB5UiFBJOTdiO1B8iuXm2GZLwdsx3Z73RpEseyViWJWXV?=
 =?us-ascii?Q?RdHjSjC6M6AFSVF2YvasvjK/crjTmRzsXPWBorSnK5/zWNcBgmfac8uHZZzR?=
 =?us-ascii?Q?75uPZ9blOGm0o1WRgwiKDehshxxBL/Ff2Ct5p2tmMcf+t8OQuGyhmsVadLTv?=
 =?us-ascii?Q?2NtNSNuLOgFrXsAWujoN6IsdicI02Ciuw6/jUbHIzn6bpXmSSbqmscvRFQ+C?=
 =?us-ascii?Q?rzor69JH1wgBxisGlJ6t9F/UKLgV90jcnCIA5ULHZblTR1orJl47Zll3RDbm?=
 =?us-ascii?Q?7bFB8hSpIEsYCQVayoaFc30uhZlbspQ0WE1mQ5vdhkr9GsWLerJopV/iPT/K?=
 =?us-ascii?Q?xpfCVd9W7xOsGSX8pwRVSMuDzAmPsWZG1rg8dyOPbD6VNSmyk3JFEx44kCm9?=
 =?us-ascii?Q?67omcaNn7wN6HS6SLCpzeHaxix9hEpjhgYWVn00Be9OZfR/6UrpNJ/mzEYsB?=
 =?us-ascii?Q?SBlszqI5NdChQdvnCaPkofoTZpKQjtgpRaBu5UBY6mbRKPh06NKJbyFEnAid?=
 =?us-ascii?Q?HDmjI4lqJGAsXDtNH6RHGcr1H+aKkogCxoKjl7o/ImA4Aw5gMYtQmWYypEVR?=
 =?us-ascii?Q?kdLyOc3++MSWe9xAC1Pe98mNWFwzJMvE4/sL2ORaD5PKGx8dbJX/4FVE7Bdj?=
 =?us-ascii?Q?q2Nl77uGxcSHpv3zeglt+nT8DlPmLYvMYc0FuHQ6lhDAPebPV6FiXN/Ds6/A?=
 =?us-ascii?Q?IVFw/3NKJlrYm+zACJ7oOY3xatLD7icguQvZnA6KV7N8MyMUoQ7cfDcURtUg?=
 =?us-ascii?Q?Z4PruMt1d+A6YiiHuKQIv91C1JcpByJa/ZXGUaUKVJtgut8vvziEA7NaF4nv?=
 =?us-ascii?Q?Ke+qoN6jnjLCcuR3HstP0pb0+chYbYsWHYHujC98tWdP5C64bUuPQv3380bn?=
 =?us-ascii?Q?+zFDuNV4XvvyZ8Z8cO500Ol19ySnvIas6vy4wK5Wi2RzpeKq8og+oeAUSQIM?=
 =?us-ascii?Q?lqLvsRjIp6Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 21:37:05.9296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20a05b3-0de1-45d0-c845-08dd52bfe338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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

Hi Dave, Simona,

New stuff for 6.15.

The following changes since commit 1abb2648698bf10783d2236a6b4a7ca5e8021699:

  drm/amdgpu: avoid buffer overflow attach in smu_sys_set_pp_table() (2025-02-12 19:47:15 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.15-2025-02-21

for you to fetch changes up to 3521276ad14fe47ce1c4382749f3c95762629375:

  drm/amdgpu: update the handle ptr in get_clockgating_state (2025-02-19 15:19:05 -0500)

----------------------------------------------------------------
amd-drm-next-6.15-2025-02-21:

amdgpu:
- Add OEM i2c support for RGB lights, etc.
- Add support for GC 11.5.3
- Add support for GC 11.5.2
- Add support for SDMA 6.1.3
- Add support for NBIO 7.11.2
- Add support for NBIO 7.9.1
- Add support for MMHUB 3.3.2
- Add support for MMHUB 1.8.1
- Add support for SMU 14.0.5
- Add support for SMUIO 13.0.11
- Add support for PSP 14.0.5
- Add support for UMC 12.5.0
- Add support for DCN 3.6.0
- JPEG 4.0.3 updates
- Add dynamic workload profile switching for GC 10-12
- support larger vbios sizes
- GC 9.5.0 updates
- SMU 13.0.12 updates
- SMU 13.0.6 updates
- IP discovery updates
- GC 10 queue reset updates
- DCN 4.0.1 updates
- UHBR link rate fixes
- Aborted suspend fix
- Mark gttsize parameter as deprecated
- GC 10 cleaner shader updates
- PSR-SU fixes
- Clean up PM4 headers
- Cursor fixes
- Enable devcoredump for JPEG
- Misc cleanups
- Runpm cleanups
- MES updates
- GC 9 gfxoff fixes
- Vbios fetching cleanups
- Documentation updates
- Update secondary plane handling
- DML2 updates
- SDMA fixes for MI
- Cleaner shader fixes for GC 11/12
- ACA updates
- Initial JPEG queue reset support
- RAS updates
- Initial RAS CPER support
- DCN/DCE panic screen handling cleanup
- BT2020 fixes
- SR-IOV fixes

amdkfd:
- synchronize pasid values between KGD and KFD
- Misc cleanups
- Improve GTT/VRAM handling for APUs
- Topology updates
- Fix user queue validation on GC 7/8

UAPI:
- Enable "Broadcast RGB" drm property
- Add INFO IOCTL query for virtualization mode
  Proposed userspace:
  https://github.com/ROCm/amdsmi/commit/e663bed7d6b3df79f5959e73981749b1f22ec698

----------------------------------------------------------------
Alex Deucher (33):
      drm/amd/display/dm: drop extra parameters to create_i2c()
      drm/amd/display/dm: drop hw_support check in amdgpu_dm_i2c_xfer()
      drm/amd/display/dc: add a new helper to fetch the OEM ddc_service
      drm/amd/display/dm: handle OEM i2c buses in i2c functions
      drm/amd/display/dm: add support for OEM i2c bus
      drm/amd/display/dc: add support for oem i2c in atom_firmware_info_v3_1
      drm/amd/display/dc: enable oem i2c support for DCE 12.x
      drm/amdgpu/atombios: drop empty function
      drm/amdgpu: rework i2c init and fini
      drm/amdgpu: add OEM i2c bus for polaris chips
      drm/amdgpu/gfx: add ring helpers for setting workload profile
      drm/amdgpu: add dynamic workload profile switching for gfx10
      drm/amdgpu: add dynamic workload profile switching for gfx11
      drm/amdgpu: add dynamic workload profile switching for gfx12
      drm/amdgpu/swsmu: set workload profile to bootup default
      drm/amdgpu: update and cleanup PM4 headers
      drm/amdgpu/sdma4: drop gfxoff calls in dump ip state
      drm/amdgpu/gfx: add amdgpu_gfx_off_ctrl_immediate()
      drm/amdgpu/gfx9: use amdgpu_gfx_off_ctrl_immediate() for PG
      drm/amdkfd: add a new flag to manage where VRAM allocations go
      drm/amdkfd: use GTT for VRAM on APUs only if GTT is larger
      drm/amdgpu/vcn2.5: split code along instances
      drm/amdgpu/mes11: fix set_hw_resources_1 calculation
      drm/amdgpu/mes: Add cleaner shader fence address handling in MES for GFX12
      drm/amdgpu/gfx: only call mes for enforce isolation if supported
      drm/amdgpu/umsch: declare umsch firmware
      drm/amdgpu/umsch: fix ucode check
      drm/amdgpu/umsch: tidy up the ucode name string handling
      drm/amdgpu/vcn5.0.1: use correct dpm helper
      drm/amdgpu/vcn5.0.1: drop dpm power helpers
      drm/amdgpu/vcn4.0.3: drop dpm power helpers
      drm/amdgpu/mes11: allocate hw_resource_1 buffer once
      drm/amdgpu/mes12: allocate hw_resource_1 buffer once

Alex Hung (2):
      drm/amd/display: Replace pr_info in dc_validate_boot_timing()
      drm/amd/display: Print seamless boot message in mark_seamless_boot_stream

Amber Lin (2):
      drm/amdgpu: Set noretry default for GC 9.5.0
      drm/amdgpu: Remove extra checks for CPX

Aric Cyr (3):
      drm/amd/display: 3.2.317
      drm/amd/display: 3.2.318
      drm/amd/display: Request HW cursor on DCN3.2 with SubVP

Asad Kamal (12):
      drm/amd/pm: Populate pmfw version for SMU v13.0.12
      drm/amd/pm: Fill ip version for SMU v13.0.12
      drm/amd/pm: Update metrics tbl struct for smu_v_13.0.6
      drm/amd/pm: Add metrics table header for smu_v13_0_12
      drm/amd/pm: Add SMUv13.0.12 PPT interface
      drm/amd/pm: Add metrics support for smuv13.0.12
      drm/amd/pm: Skip showing MCLK_OD level
      drm/amd/pm: Update pm attr for gc_9_5_0
      drm/amd/pm: Skip P2S load for SMU v13.0.12
      drm/amdgpu: Add flags to distinguish vf/pf/pt mode
      drm/amd/pm: Rename pmfw message SetPstatePolicy
      drm/amd/pm: Limit jpeg rings as per max for jpeg_v_4_0_3

Aurabindo Pillai (2):
      drm/amd/display: Make dcn401_program_pipe non static
      drm/amd/display: Add log for MALL entry on DCN32x

Ausef Yousof (1):
      drm/amd/display: limit coverage of optimization skip

Austin Zheng (3):
      drm/amd/display: Use Nominal vBlank If Provided Instead Of Capping It
      drm/amd/display: Account For OTO Prefetch Bandwidth When Calculating Urgent Bandwidth
      drm/amd/display: DML21 Reintegration

Brandon Syu (1):
      Revert "drm/amd/display: Exit idle optimizations before attempt to access PHY"

Brendan Tam (1):
      drm/amd/display: add workaround flag to link to force FFE preset

Candice Li (2):
      drm/amdgpu: Enable ACA by default for psp v13_0_12
      drm/amdgpu: Optimize the enablement of GECC

Charlene Liu (2):
      drm/amd/display: Exclude clkoffset and ips setting for dcn351 specific
      drm/amd/display: pass calculated dram_speed_mts to dml2

Colin Ian King (1):
      drm/amd/display: remove extraneous ; after statements

Dillon Varone (3):
      drm/amd/display: Populate register address for dentist for dcn401
      drm/amd/display: Ammend DCPG IP control sequences to align with HW guidance
      drm/amd/display: Fixes for mcache programming in DML21

Dmytro (1):
      drm/amd/display: Allow reuse of of DCN4x code

Dr. David Alan Gilbert (8):
      drm/amdkfd: Remove unused functions
      drm/amd/display: Remove unused mpc1_is_mpcc_idle
      drm/amd/display: Remove unused freesync functions
      drm/amd/display: Remove unused dc_stream_get_crtc_position
      drm/amd/display: Remove unused get_clock_requirements_for_state
      drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
      drm/amd/display: Remove unused get_max_support_fbc_buffersize
      drm/amd/display: Remove unused link_enc_cfg_get_link_enc_used_by_stream

Eric Huang (1):
      drm/amdkfd: fix missing L2 cache info in topology

George Shen (2):
      drm/amd/display: Update CR AUX RD interval interpretation
      drm/amd/display: Read LTTPR ALPM caps during link cap retrieval

Hansen Dsouza (1):
      drm/amd/display: Add boot option to reduce PHY SSC for HBR3

Harish Kasiviswanathan (1):
      drm/amdgpu: Set snoop bit for SDMA for MI series

Harry VanZyllDeJong (1):
      drm/amd/display: Add support for disconnected eDP streams

Harry Wentland (1):
      drm/amd/display: Don't treat wb connector as physical in create_validate_stream_for_sink

Hawking Zhang (6):
      drm/amdgpu: Update usage for bad page threshold
      drm/amd/include: Add amd cper header
      drm/amdgpu: Introduce funcs for populating CPER
      drm/amdgpu: Include ACA error type in aca bank
      drm/amdgpu: Introduce funcs for generating cper record
      drm/amdgpu: Generate cper records

Ian Chen (1):
      drm/amd/display: Add AS SDP programming for UHBR link rate.

Ilya Bakoulin (2):
      drm/amd/display: Don't try AUX transactions on disconnected link
      drm/amd/display: Fix BT2020 YCbCr limited/full range input

Jesse.zhang@amd.com (2):
      drm/amdgpu/gfx10: implement queue reset via MMIO
      drm/amdgpu/gfx10: implement gfx queue reset via MMIO

Jiang Liu (2):
      amdgpu/soc15: enable asic reset for dGPU in case of suspend abort
      drm/amdgpu: reset psp->cmd to NULL after releasing the buffer

Joshua Aberback (1):
      drm/amd/display: Increase block_sequence array size

Josip Pavic (1):
      drm/amd/display: log destination of vertical interrupt

Le Ma (1):
      drm/amdgpu: read harvest info from harvest table for gfx950

Leo Zeng (2):
      drm/amd/display: add new IRQ enum for underflows
      Revert "drm/amd/display: Request HW cursor on DCN3.2 with SubVP"

Lijo Lazar (19):
      drm/amdgpu: Add VCN v4.0.3 RRMT register offset
      drm/amdgpu: Check RRMT status for VCN v4.0.3
      drm/amdgpu: Check RRMT status for JPEG v4.0.3
      drm/amdgpu: Use active umc info from discovery
      drm/amdgpu: Pass IP instance/hwid as parameters
      drm/amdgpu: Use version to figure out harvest info
      drm/amdgpu: Clean up GFX v9.4.3 IP version checks
      drm/amdgpu: Clean up IP version checks in gmcv9.0
      drm/amd/pm: Limit to 8 jpeg rings per instance
      drm/amdgpu: Clean up atom header file inclusion
      drm/amd/pm: Add APIs for device access checks
      drm/amd/pm: Fix get_if_active usage
      drm/amd/pm: Remove unnecessary device state checks
      drm/amdgpu: Add wrapper for freeing vbios memory
      drm/amdgpu: Add VBIOS flags
      drm/amdgpu: Add flag to make VBIOS read optional
      drm/amdgpu: Make VBIOS image read optional
      drm/amd/pm: Fetch current power limit from PMFW
      drm/amdgpu: Use firmware supported NPS modes

Mangesh Gadre (4):
      drm/amdgpu: Add support for umc 12.5.0/mmhub 1.8.1
      drm/amdgpu: Add support for smu 13.0.12
      drm/amdgpu: Add support for nbio 7.9.1
      drm/amdgpu: Add support for smuio 13.0.11

Mario Limonciello (6):
      drm/amd/display: Add debug messages for dc_validate_boot_timing()
      drm/amd/display: Decrease message about seamless boot enabled to debug
      drm/amd/display: Add new log type `DC_LOG_INFO`
      drm/amd: Mark amdgpu.gttsize parameter as deprecated and show warnings on use
      drm/amd/display: Refactor mark_seamless_boot_stream()
      drm/amd: Refactor find_system_memory()

Martin Tsai (1):
      drm/amd/display: Support multiple options during psr entry.

Muhammad Ahmed (1):
      drm/amd/display: Enable odm 4:1 when debug key is set

Nathan Chancellor (1):
      drm/amd/display: Reapply 2fde4fdddc1f

Nicholas Kazlauskas (1):
      drm/amd/display: Guard against setting dispclk low when active

Nikita Zhandarovich (1):
      drm/radeon/ci_dpm: Remove needless NULL checks of dpm tables

Oleh Kuzhylnyi (1):
      drm/amd/display: Add total_num_dpps_required field to informative structure

Ovidiu Bunea (1):
      drm/amd/display: Exit idle optimizations before accessing PHY

Peichen Huang (2):
      drm/amd/display: refactor dio link encoder assigning
      drm/amd/display: dpia should avoid encoder used by dp2

Peterson Guo (1):
      drm/amd/display: Reverse the visual confirm recouts

Philip Yang (2):
      drm/amdgpu: Unlocked unmap only clear page table leaves
      drm/amdkfd: Fix user queue validation on Gfx7/8

Rodrigo Siqueira (4):
      drm/amd/display: Add DCC/Tiling reset helper for DCN and DCE
      drm/amd/display: Rename panic function
      drm/amd/display: Add clear DCC and Tiling callback for DCN
      drm/amd/display: Add clear DCC and Tiling callback for DCE

Saleemkhan Jamadar (2):
      drm/amdgpu/vcn: enable TMZ support for vcn 4_0_5
      drm/amdgpu/umsch: remove vpe test from umsch

Samson Tam (5):
      drm/amd/display: Move SPL to a new path
      drm/amd/display: use s1_12 filter tables in SPL
      drm/amd/display: remove TF check for LLS policy
      drm/amd/display: add s1_12 filter tables
      drm/amd/display: sspl: cleanup filter code

Sathishkumar S (19):
      drm/amdgpu: increase amdgpu max rings limit
      drm/amdgpu: Add a func for core specific reg offset
      drm/amdgpu: Add helper funcs for jpeg devcoredump
      drm/amdgpu: Enable devcoredump for JPEG4_0_3
      drm/amdgpu: Enable devcoredump for JPEG5_0_1
      drm/amdgpu: Enable devcoredump for JPEG4_0_0
      drm/amdgpu: Enable devcoredump for JPEG4_0_5
      drm/amdgpu: Enable devcoredump for JPEG3_0_0
      drm/amdgpu: Enable devcoredump for JPEG2_0_0
      drm/amdgpu: Enable devcoredump for JPEG2_5_0
      drm/amdgpu: Enable devcoredump for JPEG5_0_0
      drm/amdgpu: Per-instance init func for JPEG4_0_3
      drm/amdgpu: Add ring reset callback for JPEG4_0_0
      drm/amdgpu: Add ring reset callback for JPEG3_0_0
      drm/amdgpu: Per-instance init func for JPEG2_5_0
      drm/amdgpu: Add ring reset callback for JPEG2_5_0
      drm/amdgpu: Add ring reset callback for JPEG2_0_0
      drm/amdgpu: Add JPEG4_0_3 core reset control reg
      drm/amdgpu: Add ring reset callback for JPEG4_0_3

Shaoyun Liu (2):
      drm/amd/include : MES v11 and v12 API header update
      drm/amd/include : Update MES v12 API for fence update

Shiwu Zhang (2):
      drm/amdgpu: enlarge the VBIOS binary size limit
      drm/amdgpu: Enable IFWI update support with PSPv13.0.12

Srinivasan Shanmugam (6):
      drm/amdgpu/gfx10: Add cleaner shader for GFX10.1.10
      drm/amdgpu/gfx10: Enable cleaner shader for GFX10.1.1/10.1.2 GPUs
      drm/amdgpu/mes: Add cleaner shader fence address handling in MES for GFX11
      drm/amdgpu: Rename VCN clock gating function for consistency
      drm/amdgpu: Replace Mutex with Spinlock for RLCG register access to avoid Priority Inversion in SRIOV
      drm/amdkfd: Fix error handling for missing PASID in 'kfd_process_device_init_vm'

Sung Lee (1):
      drm/amd/display: Guard Possible Null Pointer Dereference

Sunil Khatri (1):
      drm/amdgpu: update the handle ptr in get_clockgating_state

Taimur Hassan (3):
      drm/amd/display: 3.2.319
      drm/amd/display: 3.2.320
      drm/amd/display: 3.2.321

Tao Zhou (4):
      drm/amdgpu: add RAS CPER ring buffer
      drm/amdgpu: read CPER ring via debugfs
      drm/amdgpu: add data write function for CPER ring
      drm/amdgpu: add mutex lock for cper ring

Tim Huang (8):
      drm/amdgpu: add support for GC IP version 11.5.3
      drm/amdgpu: add support for SDMA IP version 6.1.3
      drm/amdgpu: add support for NBIO IP version 7.11.2
      drm/amdgpu: add support for MMHUB IP version 3.3.2
      drm/amdgpu: enable VCN/JPEG CGPG for GC IP version 11.5.3
      drm/amdgpu: add support for SMU IP version 14.0.5
      drm/amdgpu: add support for PSP IP version 14.0.5
      drm/amdgpu: add discovery support for DCN IP version 3.6.0

Tom Chung (2):
      drm/amd/display: Initial psr_version with correct setting
      drm/amd/display: Disable PSR-SU on some OLED panel

Victor Skvortsov (1):
      drm/amdgpu: Skip err_count sysfs creation on VF unsupported RAS blocks

Wayne Lin (12):
      drm/amd/display: Add dcn36 register header files
      drm/amd/display: Add DCN36 version identifiers
      drm/amd/display: Add DCN36 BIOS command table support
      drm/amd/display: Add DCN36 IRQ
      drm/amd/display: Add DCN36 Resource
      drm/amd/display: Add DCN36 GPIO
      drm/amd/display: Add DCN36 DML2 support
      drm/amd/display: Add DCN36 DMCUB
      drm/amd/display: Support DCN36 DSC
      drm/amd/display: Support DCN36 HDCP
      drm/amd/display: Add DCN36 CORE
      drm/amd/display: Add DCN36 DM Support

Xiang Liu (5):
      drm/amdgpu: Get timestamp from system time
      drm/amdgpu: Commit CPER entry
      drm/amdgpu: Generate bad page threshold cper records
      drm/amdgpu: Check aca enabled inside cper init/fini func
      drm/amdgpu: Remove redundant check of adev

Xiaogang Chen (2):
      drm/amdkfd: Have kfd driver use same PASID values from graphic driver
      drm/amdkfd: Fix pasid value leak

Yan Li (1):
      drm/amd/display: Support "Broadcast RGB" drm property

Yang Wang (1):
      drm/amdgpu: refine smu send msg debug log format

Yifan Zha (1):
      drm/amd/pm: Update smu_v13_0_0 SRIOV VF flag in msg mapping table

Ying Li (2):
      drm/amd/pm: add support for IP version 11.5.2
      drm/amd/amdgpu: add support for IP version 11.5.2

Zaeem Mohamed (2):
      drm/amd/display: Expose 3 secondary planes for supported ASICs
      drm/amd/display: docstring definitions MAX_SURFACES and MAX_PLANES

Zhikai Zhai (1):
      drm/amd/display: Update Cursor request mode to the beginning prefetch always

 drivers/gpu/drm/amd/amdgpu/Makefile                |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   564 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h           |   105 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   116 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |    19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    84 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |     9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    91 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    42 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   465 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    18 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   100 +-
 .../gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h  |    35 +
 .../drm/amd/amdgpu/gfx_v10_1_10_cleaner_shader.asm |   126 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    44 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    32 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    74 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    22 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    92 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     4 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |     4 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |     4 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    37 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   142 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    37 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    41 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   346 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |    25 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    22 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |    49 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |    61 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    51 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    19 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    25 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    31 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     5 +-
 drivers/gpu/drm/amd/amdgpu/nvd.h                   |   208 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |    10 +
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |     3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    13 +-
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |   139 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    34 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |     5 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   839 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |    20 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |     5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |     6 -
 drivers/gpu/drm/amd/amdgpu/vi.c                    |     4 +-
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |    18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    25 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |    14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     9 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    85 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    43 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c             |    24 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   121 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    64 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    17 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   141 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |     2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    20 +
 drivers/gpu/drm/amd/display/dc/Makefile            |     2 +-
 drivers/gpu/drm/amd/display/dc/basics/dc_common.c  |     3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    15 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    17 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |     2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   169 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |     5 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    27 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |     6 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   299 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    31 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    19 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    50 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    12 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |     2 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     4 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |     4 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |     1 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    12 -
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     7 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    24 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    40 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |     3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     4 +
 .../drm/amd/display/dc/dce110/dce110_compressor.c  |    13 -
 .../drm/amd/display/dc/dce110/dce110_compressor.h  |     2 -
 .../drm/amd/display/dc/dce60/dce60_hw_sequencer.c  |     1 +
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     7 +-
 .../display/dc/dio/dcn10/dcn10_stream_encoder.c    |     3 +-
 .../dc/dio/dcn30/dcn30_dio_stream_encoder.c        |     2 +-
 .../dc/dio/dcn30/dcn30_dio_stream_encoder.h        |     6 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |    15 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.h      |    18 +
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |     3 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |     2 +
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |     1 +
 .../display/dc/dml2/display_mode_core_structs.h    |     1 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |     1 -
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    14 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    10 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |    32 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h   |     3 -
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   126 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c | 12413 ----
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |    12 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |     3 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |     4 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h   |     2 -
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |     2 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    20 +
 .../dml2/dml21/src/dml2_top/dml2_top_interfaces.c  |     1 -
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    |     8 -
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |   354 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |     5 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |     6 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |     6 -
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |     1 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |     3 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |     9 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |     1 +
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.h   |     1 -
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.h   |     1 -
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    19 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |     7 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 .../dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c     |     3 +-
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c       |     2 +-
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.h       |     1 +
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c |    18 -
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |     3 -
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |    14 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.h |    16 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |     5 +-
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |     2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |     2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.h |     1 +
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |     8 +
 .../drm/amd/display/dc/hwss/dce100/dce100_hwseq.c  |    30 +
 .../drm/amd/display/dc/hwss/dce100/dce100_hwseq.h  |     4 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |     3 +
 .../drm/amd/display/dc/hwss/dce120/dce120_hwseq.c  |     2 +
 .../drm/amd/display/dc/hwss/dce80/dce80_hwseq.c    |     1 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   102 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |     4 +
 .../gpu/drm/amd/display/dc/hwss/dcn10/dcn10_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    17 +-
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn201/dcn201_init.c   |     1 +
 .../gpu/drm/amd/display/dc/hwss/dcn21/dcn21_init.c |     1 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |     1 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |     5 +
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |     1 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |     5 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |     1 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     1 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    84 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |     7 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |     3 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |     1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     7 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |     6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    30 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    30 +
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |     5 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     3 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     9 +
 .../amd/display/dc/irq/dcn36/irq_service_dcn36.c   |   408 +
 .../amd/display/dc/irq/dcn36/irq_service_dcn36.h   |    12 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |     1 +
 .../display/dc/link/protocols/link_dp_capability.c |    12 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |     8 +-
 .../display/dc/link/protocols/link_dp_training.c   |     2 +
 .../dc/link/protocols/link_dp_training_8b_10b.c    |     7 +-
 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |     2 +-
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |     2 +-
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c   |    16 -
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h   |     4 -
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |     4 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |     5 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |     7 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    16 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |     1 +
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.c   |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |     1 +
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |    71 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |     7 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |     1 +
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.h   |     4 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |     3 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |     3 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    23 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    22 +-
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |     8 +
 .../display/dc/resource/dce120/dce120_resource.c   |    17 +
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |     6 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |     3 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |     7 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.h |     3 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |     7 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  2171 +
 .../amd/display/dc/resource/dcn36/dcn36_resource.h |    73 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |    12 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |     3 +-
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.h    |    22 -
 .../gpu/drm/amd/display/dc/{spl => sspl}/Makefile  |     2 +-
 .../gpu/drm/amd/display/dc/{spl => sspl}/dc_spl.c  |    31 +-
 .../gpu/drm/amd/display/dc/{spl => sspl}/dc_spl.h  |     0
 .../amd/display/dc/{spl => sspl}/dc_spl_filters.c  |     0
 .../amd/display/dc/{spl => sspl}/dc_spl_filters.h  |     0
 .../dc/{spl => sspl}/dc_spl_isharp_filters.c       |   452 +-
 .../dc/{spl => sspl}/dc_spl_isharp_filters.h       |    18 +-
 .../dc/{spl => sspl}/dc_spl_scl_easf_filters.c     |  1058 +-
 .../dc/{spl => sspl}/dc_spl_scl_easf_filters.h     |     9 +-
 .../display/dc/{spl => sspl}/dc_spl_scl_filters.c  |   232 +-
 .../drm/amd/display/dc/sspl/dc_spl_scl_filters.h   |    13 +
 .../amd/display/dc/{spl => sspl}/dc_spl_types.h    |     0
 .../display/dc/{spl => sspl}/spl_custom_float.c    |     0
 .../display/dc/{spl => sspl}/spl_custom_float.h    |     0
 .../drm/amd/display/dc/{spl => sspl}/spl_debug.h   |     0
 .../amd/display/dc/{spl => sspl}/spl_fixpt31_32.c  |     0
 .../amd/display/dc/{spl => sspl}/spl_fixpt31_32.h  |     0
 .../amd/display/dc/{spl => sspl}/spl_os_types.h    |     0
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |     6 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.c  |    34 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.h  |    13 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     4 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 drivers/gpu/drm/amd/display/include/logger_types.h |     1 +
 .../drm/amd/display/modules/freesync/freesync.c    |   137 -
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |    26 -
 .../amd/display/modules/info_packet/info_packet.c  |     4 +-
 drivers/gpu/drm/amd/include/amd_cper.h             |   269 +
 drivers/gpu/drm/amd/include/amd_shared.h           |     2 +-
 .../amd/include/asic_reg/dcn/dcn_3_6_0_offset.h    | 15485 +++++
 .../amd/include/asic_reg/dcn/dcn_3_6_0_sh_mask.h   | 61940 +++++++++++++++++++
 .../include/asic_reg/mmhub/mmhub_9_4_1_offset.h    |    32 +
 .../include/asic_reg/mmhub/mmhub_9_4_1_sh_mask.h   |    48 +
 .../amd/include/asic_reg/vcn/vcn_4_0_3_offset.h    |    37 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     3 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    42 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |     3 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   641 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    26 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   138 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   115 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   101 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   238 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |     8 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     1 -
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |     2 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     3 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |    34 +-
 include/uapi/drm/amdgpu_drm.h                      |    10 +
 361 files changed, 87610 insertions(+), 16758 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_1_10_cleaner_shader.asm
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/Makefile (96%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_filters.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_filters.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_isharp_filters.c (62%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_isharp_filters.h (61%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_scl_easf_filters.c (60%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_scl_easf_filters.h (79%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_scl_filters.c (87%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_filters.h
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/dc_spl_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/spl_custom_float.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/spl_custom_float.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/spl_debug.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/spl_fixpt31_32.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/spl_fixpt31_32.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl => sspl}/spl_os_types.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.h
 create mode 100644 drivers/gpu/drm/amd/include/amd_cper.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_6_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_6_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
