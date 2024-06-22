Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE139134D4
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 17:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBB010E193;
	Sat, 22 Jun 2024 15:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OrWl/+1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB76E10E183;
 Sat, 22 Jun 2024 15:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPGrNl8wscJDP8u8uknB+9derNoLExw7jH1X8dRtMX65wkMeLAnsf6vvp5Hj2wfZzc9l/0e7ubtUdD2rNb/95xLvsqaOvJcSD8NP0iLmdJzdkOoNi3HLJMKCp0bLTcMxKaTiw4qnuQROuLXcqeU7GGu3/Zpv7c1eetAf1dlnyGJFDl0ibqDUWsHNVg2/BC6j6B8CNTb44yzg5s+vrgSpFBkO1noleWvJwIpR0wXcV+lx/ZrMXWxIsGTqVzDfulDUhpGhMUujPBkt16TeKbZmNXF0Qs0xaWEy80DA611v6G7+7iKaK8hdU4xKChT2skoEElK3K1QlSelV6+nOu3Hcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYhHtqnpcYGYi9V5/jmnsAjVT8+OxfUgf1gj3DDdgw0=;
 b=Xg25PoIFZP4uCjJWP2n2yZ9ocR3+vzyknJhV7feNJDPzmKC7vAlR2bC2jacQGJhuIgZ8jvHwwj3Mi5fQ/apOljTpGQ8lbRlDY5wC9cInA9gL5C4qXsUyF22XUaLO+JE6kqBgR4+11mfRKz7xWkvJB34kq6HtgqQkK03KgJ+F8Hns6jj87oJiHlMzu71GFWmT9Q7sqDI3gq72ugq0RQhHTHrnUKIYh0yIAMDBauKlhOE2v+D+bqg3RA63Lr3ZE4hNBBeAeHa3POc0acyU/UPn+5tZ3dMNtkBhKcPX/VA7iyELwMuu92VbUuIaxVRidqb353aU0iAvOa7Y6inYwh7iVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYhHtqnpcYGYi9V5/jmnsAjVT8+OxfUgf1gj3DDdgw0=;
 b=OrWl/+1FaIAtZa57O05xIz3YhOQVMoI9JeSohZoSGUjml0Ci0s50uBqvdh5SlokKuZk6aL0KMIa+XEV1oXb4JaLDVZcmKUDi87yZD+emVv4KDh/le9zPeGAu0nBFCkBF0M5F010JYTCCqKw7vDkXaypcaeYrWZX32CoYQNH3qvE=
Received: from BL0PR0102CA0066.prod.exchangelabs.com (2603:10b6:208:25::43) by
 SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Sat, 22 Jun
 2024 15:25:40 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:25:cafe::b7) by BL0PR0102CA0066.outlook.office365.com
 (2603:10b6:208:25::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Sat, 22 Jun 2024 15:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Sat, 22 Jun 2024 15:25:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 22 Jun
 2024 10:25:38 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.11
Date: Sat, 22 Jun 2024 11:25:22 -0400
Message-ID: <20240622152523.2267072-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ2PR12MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: b950938b-8342-43cd-0332-08dc92cf929e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|82310400023|36860700010|1800799021; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG91THphNzJEbXJrSVg1bmdnT0N0a3J2cjdZZXVzakMxcitJQWtZT1hqUGox?=
 =?utf-8?B?Nis2VFJSOHZxMFF2cmZDZTJQamVlQ3hRYzNyZVByUkFMYmRvcFo4OGd6bnVt?=
 =?utf-8?B?d1pwT1RHRU45eU0rUy9LQTlNNmxISjd2RnUrN1BEUVhYVkkvZHc0d0NTN1Zi?=
 =?utf-8?B?OCtDL05jeGtRUHVYS3E1VWRZR0hsRGpoS3RpZmFWZ00zSHFhQzZCdGNDdWFN?=
 =?utf-8?B?bklHRmdPeGZyczk4b3BMa1E4UkRxaWI2YWc2allZcmVkUHErblBIMWNkeDZR?=
 =?utf-8?B?L1JmM0JCaURqSDhKbTFGb2s0dld1aWlxSE41WUdNZGwzNGdxWW9TcmQxc1BM?=
 =?utf-8?B?ZFRZVnI4Yy9BRnNjSTVXbmh6ZkFLUkE5Y3UwbVhmMnByUGZBa1UyWFZRWDJl?=
 =?utf-8?B?UFlOVEo1YmVtYnl6R1ZDS0s2dDRGK01XakxBZHJGN1FkV1hTUk5EWWNFRlNQ?=
 =?utf-8?B?c1VEVDEzd1RQdHd5VWR3Q0JocDhRcThlcUNVdXNYZXQxd0FCQnA3aHRCeVJu?=
 =?utf-8?B?eUNOdC9memlpMG85WEVYUGF0dTF2YjJQWjE4QzRJaTF0UzYyVVNKb2VvSjk1?=
 =?utf-8?B?aGVGRzJXbm9xS05VdTV0ZWc4U0pqQm9kdDQ5UDBERE5RSndYOE9OUllWT3Jq?=
 =?utf-8?B?UXI1eXJ0c2NwTEtZb3Y5YTRSSnVMRFVXMHJJcVZ4NVZyaml2VkwvNmlwNldX?=
 =?utf-8?B?bm9vNTAydytMYkRZckdyZjUvaEVaNEJra1FROXBkQWZ6ZmI2alBEREc1cEZG?=
 =?utf-8?B?dWtyd0NWN2N2eVBxVnlwUllHZFIvV2pEN3BLdWNPZzhOaFBKR3BpSUM2MmVp?=
 =?utf-8?B?cmszSnkvZGhwZWFCM2dDeFZJN1VjTkVUdkJTMVB6YkNUOG9rcFliSUZDbURX?=
 =?utf-8?B?dXFlZGt0WC9Va3hhVEttSkkzb3Q2TjRtZzFsRTBCbUVwcVFzL0MydHZFNVo2?=
 =?utf-8?B?U05Jak5YVy9qME5sV1FwNHBZS2tOTnM3MXhpWk0zOHVMSzA1cjZTMWRiWHdS?=
 =?utf-8?B?elNBQVhPUkcrSVlKMnVPd2QwYkFHcXdjRW95NHBvVkE5cnF2TldXY2Fzb1Vp?=
 =?utf-8?B?aHRqWUwrM2liMm1Iclk0S0xDQnNCK25IYUFsYS9kRFZMd3hKTVZOa2x1eEFt?=
 =?utf-8?B?NzF2Y1YrQkt2SzA5TlNUN080NWhSZkczYkswUGs4aGMxa3V4VjdhRjVlVW9x?=
 =?utf-8?B?SExRWkJKOGRMVitUL3pUeSt4S3FleUZWSTh2c2RuNHpjSFoxVUZTOEFkRUFV?=
 =?utf-8?B?NWVJQldKYnVDdnM1YitIbTdFUTVQVnRjRlczMGF5OW1JYThXWkJpMTg4V2Mr?=
 =?utf-8?B?VmUwbHBHcXgyUnZ3YktsTkJhTXhGM2xEQWViRE5zU0JadlpvWEc2RE0zUnNt?=
 =?utf-8?B?Sk1BcW1MWmlJVVJVc2o3cGNpZ2pQZlc0L2xGdlJLdjB3SERmZGNYeHYzalgz?=
 =?utf-8?B?UkZuOWowbTJzVm5jdm5VTmEwSzhFWjVRbnNvMGZZVlE4Sml4aHpHRGNqdkpF?=
 =?utf-8?B?eDNTQmhZZWhwclhNN2FVUms2RmhzMHJDbjlhRTdkWE9UYzZJM053QlY1QVZV?=
 =?utf-8?B?Sld5bGVab08vYVhWcE96Z0dtY0ZYZWRzRmI4WkdOc2dVSWtxR2cvTGpKL3Z2?=
 =?utf-8?B?QkROakhsbUFObHA4QkFVK09xcHJZVkRHbDUvY2xoV0IzS2h0MEFFMzhTVSs5?=
 =?utf-8?B?VUNwZ3llR21scXpMRDdlTmNtMFN4Y2tXc2M4UmRFclBQSm01Mi9HNjcxT1A4?=
 =?utf-8?B?aXZHcmNCK1MvQUpYNEEzaDhaYjBlOHZMRHRtRVdiMXljOExRMEk4a1RYZWxX?=
 =?utf-8?Q?LsgYNp2h4LRBQ6h4bXksF1WM4Gm1HVSiB41tk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(82310400023)(36860700010)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 15:25:39.4701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b950938b-8342-43cd-0332-08dc92cf929e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822
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

More new stuff for 6.11.

The following changes since commit b95fa494d6b74c30eeb4a50481aa1041c631754e:

  drm/amdgpu: add RAS is_rma flag (2024-06-05 11:25:14 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-06-22

for you to fetch changes up to 1ecef5589320fd56af599b624d59c355d162ac7b:

  drm/amdgpu: init TA fw for psp v14 (2024-06-19 12:52:43 -0400)

----------------------------------------------------------------
amd-drm-next-6.11-2024-06-22:

amdgpu:
- HPD fixes
- PSR fixes
- DCC updates
- DCN 4.0.1 fixes
- FAMS fixes
- Misc code cleanups
- SR-IOV fixes
- GPUVM TLB flush cleanups
- Make VCN less verbose
- ACPI backlight fixes
- MES fixes
- Firmware loading cleanups
- Replay fixes
- LTTPR fixes
- Trap handler fixes
- Cursor and overlay fixes
- Primary plane zpos fixes
- DML 2.1 fixes
- RAS updates
- USB4 fixes
- MALL fixes
- Reserved VMID fix
- Silence UBSAN warnings

amdkfd:
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu: add additional VM bits
      drm/amd/display: use pre-allocated temp structure for bounding box
      drm/amd/display/dcn401: use pre-allocated temp structure for bounding box
      drm/radeon: fix UBSAN warning in kv_dpm.c
      drm/amdgpu: fix UBSAN warning in kv_dpm.c
      drm/amdgpu: cleanup MES12 command submission
      drm/amdgpu: remove amdgpu_mes_fence_wait_polling()

Alex Hung (22):
      drm/amd/display: Increase MAX_LINKS by 2
      drm/amd/display: Fix incorrect size calculation for loop in dcn401
      drm/amd/display: Fix uninitialized variables in dcn401
      drm/amd/display: Remove useless comparison of unsigned int vs. 0
      drm/amd/display: Remove NO_EFFECT self-assignment
      drm/amd/display: Explicitly cast v_total to signed in a subtraction
      drm/amd/display: Avoid overflow from uint32_t to uint8_t
      drm/amd/display: Explicitly extend unsigned 16 bit to 64 bit
      drm/amd/display: Add null checker before passing variables
      drm/amd/display: Check BIOS images before it is used
      drm/amd/display: Skip wbscl_set_scaler_filter if filter is null
      drm/amd/display: Add null checker before access structs
      drm/amd/display: Check dc_stream_state before it is used
      drm/amd/display: Check pipe_ctx before it is used
      drm/amd/display: Covert integers to double before divisions
      drm/amd/display: Remove redundant checks for res_pool->dccg
      drm/amd/display: Remove redundant checks for ctx->dc_bios
      drm/amd/display: Remove redundant null checks
      drm/amd/display: Remove redundant checks for opp
      drm/amd/display: Remove redundant checks for context
      drm/amd/display: Check UnboundedRequestEnabled's value
      drm/amd/display: Remove redundant null checks

Alvin Lee (5):
      drm/amd/display: Program DIG FE source select for DVI before PHY en
      drm/amd/display: Remove NULL assignment for stream_status
      drm/amd/display: Ignore phantom DTBCLK requirement
      drm/amd/display: populate hardware_release hook for dcn401
      drm/amd/display: Make sure to reprogram ODM when resync fifo

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.220.0
      drm/amd/display: [FW Promotion] Release 0.0.221.0
      drm/amd/display: [FW Promotion] Release 0.0.222.0

Aric Cyr (3):
      drm/amd/display: dc 3.2.287
      drm/amd/display: 3.2.288
      drm/amd/display: 3.2.289

Bob Zhou (2):
      drm/amdgpu: fix the overflowed constant warning for RREG32_SOC15()
      drm/amdgpu: fix overflowed constant warning in mmhub_set_clockgating()

Chiawen Huang (1):
      drm/amd/display: add set ips disable

Chris Park (4):
      drm/amd/display: Change AVI Info Frame version to 4 for OVT
      drm/amd/display: Prevent overflow on DTO calculation
      drm/amd/display: Avoid programming DTO if Refclk is 0
      drm/amd/display: On clock init, maintain DISPCLK freq

Christian König (3):
      drm/amdgpu: revert "take runtime pm reference when we attach a buffer" v2
      drm/amdgpu: fix using the reserved VMID with gang submit
      drm/amdgpu: cleanup MES11 command submission

ChunTao Tso (3):
      drm/amd/display: Introduce deferred Replay coasting vtotal update
      drm/amd/display: Replay low hz
      drm/amd/display: Replay + IPS + ABM in Full Screen VPB

Daniel Miess (2):
      drm/amd/display: Change dram_clock_latency to 34us for dcn351
      drm/amd/display: Disable PHYSYMCLK RCO

Daniel Sa (1):
      drm/amd/display: Return after Init

David (Ming Qiang) Wu (1):
      drm/amdgpu: drop some kernel messages in VCN code

Dennis Chan (1):
      drm/amd/display: Fix Replay Desync Error Test

Dillon Varone (10):
      drm/amd/display: Force max clocks unconditionally when p-state is unsupported
      drm/amd/display: Add recovery timeout to FAMS2
      drm/amd/display: Various DML2 fixes for FAMS2
      drm/amd/display: Block SubVP if hardware rotation is used in DML2.1
      drm/amd/display: Add null check for phantom pipes in prepare mcache
      drm/amd/display: Fix missed targets in FAMS2+HWFQ
      drm/amd/display: Do not override dml2.1 reinit
      drm/amd/display: Update idle hardmins if uclk or fclk requirement changed
      drm/amd/display: Enable DCN401 idle optimizations by default
      drm/amd/display: Add null check to dml21_find_dc_pipes_for_plane

Eric Huang (2):
      drm/amdgpu: fix NULL pointer in amdgpu_reset_get_desc
      drm/amdgpu: add reset source in various cases

Frank Min (1):
      drm/amdgpu: add sdma 7.0 support for copy dcc buffer

George Shen (1):
      drm/amd/display: Ignore UHBR13.5 cable ID cap for passive cable max link rate

Hamza Mahfooz (1):
      drm/amd/display: prevent register access while in IPS

Harish Kasiviswanathan (1):
      drm/amdgpu: Indicate CU havest info to CP

Ivan Lipski (10):
      Revert "drm/amd/display: Add null check for 'afb' in amdgpu_dm_update_cursor"
      Revert "drm/amd/display: Add NULL check for 'afb' before dereferencing in amdgpu_dm_plane_handle_cursor_update"
      drm/amd/display: Remove redundant if conditions
      drm/amd/display: Remove unreachable check
      drm/amd/display: Remove redundant ternary operation
      drm/amd/display: Remove duplicate 'update_idle_uclk' in dcn401 clk_mgr code
      drm/amd/display: Remove reduntant comparisons by Coverity
      drm/amd/display: Remove redundant condition with DEADCODE
      drm/amd/display: Remove redundant condition in VBA 314 func
      drm/amd/display: Remove unused value set from 'min_hratio_fact' in dml

Jack Chang (1):
      drm/amd/display: Extend PSRSU residency mode

Jay Cornwall (1):
      drm/amdkfd: Extend gfx12 trap handler fix to gfx10/11

Jesse Zhang (2):
      drm/amdgpu: remove dead code in atom_get_src_int
      drm/amd/pm: remove dead code in navi10_emit_clk_levels and navi10_print_clk_levels

JinZe.Xu (1):
      drm/amd/display: Disable IPS when it is not allowed.

Joshua Aberback (3):
      drm/amd/display: Disable boot optimization for DCN401
      drm/amd/display: DCN401 full power down in HW init if any link enabled
      Revert "drm/amd/display: workaround for oled eDP not lighting up on DCN401"

Josip Pavic (1):
      drm/amd/display: define abm debug interface

Leo Li (2):
      drm/amd/display: Introduce overlay cursor mode
      drm/amd/display: Move PRIMARY plane zpos higher

Leon Huang (1):
      drm/amd/display: Expand supported Replay residency mode

Lewis Huang (1):
      drm/amd/display: Add monitor patch skip disable crtc during psr and ips1

Li Ma (1):
      drm/amd/swsmu: add MALL init support workaround for smu_v14_0_1

Lijo Lazar (1):
      drm/amdgpu: Skip coredump during resets for debug

Likun Gao (2):
      drm/amdgpu: support for DCC feature
      drm/amdgpu: init TA fw for psp v14

Mario Limonciello (2):
      drm/amd/display: Set default brightness according to ACPI
      drm/amd/pm: powerplay: Add `__counted_by` attribute for flexible arrays

Michael Strauss (3):
      drm/amd/display: Update FIXED_VS retimer training pattern delay
      drm/amd/display: Add fallback defaults for invalid LTTPR DPCD caps
      drm/amd/display: Attempt to avoid empty TUs when endpoint is DPIA

Mounika Adhuri (1):
      drm/amd/display: Refactor DCN3X into component folder

Mukul Joshi (2):
      drm/amdgpu: Add missing locking for MES API calls
      Revert "drm/amdgpu: Add missing locking for MES API calls"

Nevenko Stupar (1):
      drm/amd/display: Fix multiple cursors when using 4 displays on a contiguous large surface

Nicholas Kazlauskas (7):
      drm/amd/display: Add outbox notification support for HPD redetect
      drm/amd/display: Guard reading 3DLUT registers for dcn32/dcn35
      drm/amd/display: Don't use fsleep for PSR exit waits on dmub replay
      drm/amd/display: Wake DMCUB before sending a command for replay feature
      drm/amd/display: Add sequential ONO sequencing for DCN35
      drm/amd/display: Remove register from DCN35 DMCUB diagnostic collection
      drm/amd/display: Disable DMCUB timeout for DCN35

Paul Hsieh (1):
      drm/amd/display: change dram_clock_latency to 34us for dcn35

Relja Vojvodic (1):
      drm/amd/display: Add dcn401 DIG fifo enable/disable

Rodrigo Siqueira (6):
      drm/amd/display: Use dc wake for get the replay state
      drm/amd/display: Use the SPDX license identifier for dmub_replay files
      drm/amd/display: Check otg_master pointer before use it
      drm/amd/display: Fix NULL pointer dereference for DTN log in DCN401
      drm/amd/display: Fix warning caused by an attempt to configure a non-otg master
      drm/amd/display: Improve warning log for get OPP for OTG master

Roman Li (1):
      drm/amd/display: Add config support entry to replay caps debugfs

Sridevi Arvindekar (3):
      drm/amd/display: DCN401 cusor code update
      drm/amd/display: Minor cleanup for DCN401 cursor related code
      drm/amd/display: mirror case cleanup for cursors

Srinivasan Shanmugam (2):
      drm/amd/display: Add null check for 'afb' in amdgpu_dm_update_cursor
      drm/amd/display: Add NULL check for 'afb' before dereferencing in amdgpu_dm_plane_handle_cursor_update

Sung Joon Kim (2):
      drm/amd/display: Fix DSC slice and delay calculations
      drm/amd/display: Send message to notify the DPIA host router bandwidth

Sung-huai Wang (1):
      Revert "drm/amd/display: Handle HPD_IRQ for internal link"

Tao Zhou (6):
      drm/amdgpu: trigger mode1 reset for RAS RMA status
      drm/amdgpu: create amdgpu_ras_in_recovery to simplify code
      drm/amdgpu: set RAS fed status for more cases
      drm/amd/pm: update check condition for SMU mode1 reset
      drm/amdkfd: use mode1 reset for RAS poison consumption
      drm/amdkfd: add ASIC version check for the reset selection of RAS poison

Thorsten Blum (1):
      drm/amd/display: Simplify if conditions

Victor Lu (1):
      drm/amdgpu: Do not wait for MP0_C2PMSG_33 IFWI init in SRIOV

Wayne Lin (6):
      drm/amd/display: Change the order of setting DP_IS_USB_C flag
      drm/amd/display: Adjust debug msg for usb4/tbt
      drm/amd/display: Defer the setting of link hpd status for usb4/tbt
      drm/amd/display: Correct the defined value for AMDGPU_DMUB_NOTIFICATION_MAX
      drm/amd/display: Don't refer to dc_sink in is_dsc_need_re_compute
      drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()

Wenjing Liu (8):
      drm/amd/display: use even ODM slice width for two pixels per container
      drm/amd/display: add odm_slice_rect parameter in spl_in
      drm/amd/display: reduce ODM slice count to initial new dc state only when needed
      drm/amd/display: remove dpp pipes on failure to update pipe params
      drm/amd/display: remove ODM combine before bandwidth validation
      drm/amd/display: use preferred link settings for dp signal only
      drm/amd/display: make ODM segment width of YCbCr422 two pixel aligned
      drm/amd/display: fix minor coding errors where dml21 phase 5 uses wrong variables

Yang Wang (18):
      drm/amdgpu: enhance amdgpu_ucode_request() function flexibility
      drm/amdgpu: refine gpu_info firmware loading
      drm/amdgpu: refine mes firmware loading
      drm/amdgpu: refine psp firmware loading
      drm/amdgpu: refine sdma firmware loading
      drm/amdgpu: move aca/mca init functions into ras_init() stage
      drm/amdgpu: refine vcn firmware loading
      drm/amdgpu: refine vpe firmware loading
      drm/amdgpu: refine gmc firmware loading
      drm/amdgpu: refine pmfw/smu firmware loading
      drm/amdgpu: refine imu firmware loading
      drm/amdgpu: refine gfx7 firmware loading
      drm/amdgpu: refine gfx8 firmware loading
      drm/amdgpu: refine gfx9 firmware loading
      drm/amdgpu: refine gfx10 firmware loading
      Revert "drm/amdgpu: change bank cache lock type to spinlock"
      Revert "drm/amdgpu: change aca bank error lock type to spinlock"
      drm/amdgpu: refine gfx6 firmware loading

Yihan Zhu (1):
      drm/amd/display: bypass ODM before CRTC off

Yunxiang Li (9):
      drm/amdgpu: add skip_hw_access checks for sriov
      drm/amdgpu: fix sriov host flr handler
      drm/amdgpu/kfd: remove is_hws_hang and is_resetting
      drm/amdgpu: remove tlb flush in amdgpu_gtt_mgr_recover
      drm/amdgpu: use helper in amdgpu_gart_unbind
      drm/amdgpu: call flush_gpu_tlb directly in gfxhub enable
      drm/amdgpu: fix locking scope when flushing tlb
      drm/amdgpu: add lock in amdgpu_gart_invalidate_tlb
      drm/amdgpu: add lock in kfd_process_dequeue_from_device

Zaeem Mohamed (1):
      drm/amd/display: Remove dcn32_smu13 duplicate header

pochchan (1):
      drm/amd/display: Use TPS3 for ALPM on Specific Panel

winstang (1):
      drm/amd/display: added NULL check at start of dc_validate_stream

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |  32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  34 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  70 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 134 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |  15 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  23 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   8 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |  11 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  25 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |  19 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  27 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  69 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  45 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   3 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   3 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   2 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   5 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  76 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  76 ++-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  39 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  39 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |   6 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h  |   8 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  12 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  11 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  10 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  16 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  38 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   1 -
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  79 ++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |  11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   4 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  13 +-
 drivers/gpu/drm/amd/display/Makefile               |   7 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 630 +++++++++++++++------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  17 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   3 -
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 244 +++++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  29 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |   6 +-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |   4 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  14 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  10 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |  10 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   4 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |   2 +-
 .../amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h | 108 ----
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  57 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |  21 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |   2 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  55 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  31 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 103 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     | 104 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  12 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  29 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   2 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   6 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  12 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |   6 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   5 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |   3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   | 145 +++--
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |  33 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c   |   3 +
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |  19 -
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |  17 -
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |  19 -
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |  63 +++
 .../dc/{ => dio}/dcn32/dcn32_dio_link_encoder.c    |   0
 .../dc/{ => dio}/dcn32/dcn32_dio_link_encoder.h    |   0
 .../dc/{ => dio}/dcn32/dcn32_dio_stream_encoder.c  |   0
 .../dc/{ => dio}/dcn32/dcn32_dio_stream_encoder.h  |   0
 .../dc/{ => dio}/dcn321/dcn321_dio_link_encoder.c  |   0
 .../dc/{ => dio}/dcn321/dcn321_dio_link_encoder.h  |   0
 .../dc/{ => dio}/dcn35/dcn35_dio_link_encoder.c    |  10 +-
 .../dc/{ => dio}/dcn35/dcn35_dio_link_encoder.h    |   0
 .../dc/{ => dio}/dcn35/dcn35_dio_stream_encoder.c  |   4 +-
 .../dc/{ => dio}/dcn35/dcn35_dio_stream_encoder.h  |   6 +
 .../dc/{ => dio}/dcn401/dcn401_dio_link_encoder.c  |   0
 .../dc/{ => dio}/dcn401/dcn401_dio_link_encoder.h  |   0
 .../{ => dio}/dcn401/dcn401_dio_stream_encoder.c   |   4 +-
 .../{ => dio}/dcn401/dcn401_dio_stream_encoder.h   |   0
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  20 +-
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |  16 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   4 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   5 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   5 -
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   2 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |   8 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |   5 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   4 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   5 -
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  11 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |   5 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  13 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   8 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |   2 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |   5 -
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  57 +-
 .../display/dc/dml2/display_mode_core_structs.h    |   1 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |   4 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |  35 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.h    |   4 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  12 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |   1 -
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  71 +--
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  28 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  10 +-
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |   4 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  15 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  13 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  34 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |   5 -
 drivers/gpu/drm/amd/display/dc/dwb/Makefile        |  37 ++
 .../drm/amd/display/dc/{ => dwb}/dcn35/dcn35_dwb.c |   0
 .../drm/amd/display/dc/{ => dwb}/dcn35/dcn35_dwb.h |   0
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |  11 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |   2 +-
 drivers/gpu/drm/amd/display/dc/hpo/Makefile        |  35 ++
 .../dc/{ => hpo}/dcn32/dcn32_hpo_dp_link_encoder.c |   0
 .../dc/{ => hpo}/dcn32/dcn32_hpo_dp_link_encoder.h |   0
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   8 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  51 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  14 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |   5 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |  19 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 102 ++--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 159 +++++-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 152 +++--
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   2 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   2 +-
 .../display/dc/link/protocols/link_dp_capability.c |  46 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  24 +-
 .../display/dc/link/protocols/link_dp_training.c   |   8 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   7 +-
 .../dc/link/protocols/link_edp_panel_control.h     |   2 +-
 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |  45 ++
 .../dc/{ => mmhubbub}/dcn32/dcn32_mmhubbub.c       |   0
 .../dc/{ => mmhubbub}/dcn32/dcn32_mmhubbub.h       |   0
 .../dc/{ => mmhubbub}/dcn35/dcn35_mmhubbub.c       |   0
 .../dc/{ => mmhubbub}/dcn35/dcn35_mmhubbub.h       |   0
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |  45 ++
 .../drm/amd/display/dc/{ => mpc}/dcn32/dcn32_mpc.c |   0
 .../drm/amd/display/dc/{ => mpc}/dcn32/dcn32_mpc.h |   0
 .../amd/display/dc/{ => mpc}/dcn401/dcn401_mpc.c   |   0
 .../amd/display/dc/{ => mpc}/dcn401/dcn401_mpc.h   |   0
 drivers/gpu/drm/amd/display/dc/opp/Makefile        |  35 ++
 .../drm/amd/display/dc/{ => opp}/dcn35/dcn35_opp.c |   0
 .../drm/amd/display/dc/{ => opp}/dcn35/dcn35_opp.h |   0
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |  11 +
 drivers/gpu/drm/amd/display/dc/pg/Makefile         |  35 ++
 .../amd/display/dc/{ => pg}/dcn35/dcn35_pg_cntl.c  |   6 +-
 .../amd/display/dc/{ => pg}/dcn35/dcn35_pg_cntl.h  |   0
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |   2 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   6 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |   4 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   3 -
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  10 +-
 .../{ => resource}/dcn32/dcn32_resource_helpers.c  |   0
 .../display/dc/resource/dcn321/dcn321_resource.c   |   8 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   7 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |   3 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |  10 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  32 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   4 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 182 +++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   5 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |   6 +
 .../drm/amd/display/modules/power/power_helpers.c  |  14 +
 .../drm/amd/display/modules/power/power_helpers.h  |   5 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |  36 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |  38 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  13 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   5 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   4 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  73 +++
 drivers/gpu/drm/radeon/sumo_dpm.c                  |   2 +
 272 files changed, 3226 insertions(+), 2030 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn32/dcn32_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn32/dcn32_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn32/dcn32_dio_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn32/dcn32_dio_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn321/dcn321_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn321/dcn321_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn35/dcn35_dio_link_encoder.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn35/dcn35_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn35/dcn35_dio_stream_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn35/dcn35_dio_stream_encoder.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn401/dcn401_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn401/dcn401_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn401/dcn401_dio_stream_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn401/dcn401_dio_stream_encoder.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dwb/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => dwb}/dcn35/dcn35_dwb.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dwb}/dcn35/dcn35_dwb.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hpo/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => hpo}/dcn32/dcn32_hpo_dp_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hpo}/dcn32/dcn32_hpo_dp_link_encoder.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => mmhubbub}/dcn32/dcn32_mmhubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => mmhubbub}/dcn32/dcn32_mmhubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => mmhubbub}/dcn35/dcn35_mmhubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => mmhubbub}/dcn35/dcn35_mmhubbub.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/mpc/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn32/dcn32_mpc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn32/dcn32_mpc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn401/dcn401_mpc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn401/dcn401_mpc.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/opp/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => opp}/dcn35/dcn35_opp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => opp}/dcn35/dcn35_opp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/pg/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => pg}/dcn35/dcn35_pg_cntl.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => pg}/dcn35/dcn35_pg_cntl.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dcn32/dcn32_resource_helpers.c (100%)
