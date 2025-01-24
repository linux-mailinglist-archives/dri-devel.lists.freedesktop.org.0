Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516AA1B8EB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 16:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CB710E9AE;
	Fri, 24 Jan 2025 15:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GU2fnbjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CBA10E997;
 Fri, 24 Jan 2025 15:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvTYdkyo3OqCfTsdFAP7nkewLAicityRL/Jl3OsMhvpu+a5DcP/XYofxD8wrrlha9GXLNLDhnfagmXm59FJR0P/z2R6T5KH1tV140VXtdGuiw5sMc6qgi9P5OkaQnLutqV5a23uMA2pzqzyFBZ4hWCKRMivwHUHbiAX0Rux/4RsooR4ADZNg/VNuYQDlK/oJLee8cbhhF73UrOhxmAID1pt84zmmHsffBkn3fNKA5P9BMKT1m2drztX3Vt5vZif8kLhVc2BQsNm3Fge0feuBIEzOrmgvotIOhDtNFfJ3gTooRHzJlYTRWtQERsTNvFnwKA7aSD/dJd+WFlDmoX8bYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eAtXjzFMmtyexOsGjWPMK/Zll/6K1xkkpUaMYInQ6k=;
 b=fQLX4rCo78YlkFlmRqVzxrT8YqhItbQ8vaGDheBawYuhTIZ9pmzBlFpcqSinJRhA994h7N13pJhFLsQAp9Wto2A5IIcp0h4dNC+5zKHGwWGv28vtLfCXECIPsRVRrit4GCOOqixaCOLKQc9yolrzkPCKRlZqLtLeJkxK2F3zKzfY/ejL5nbGgQRR96mKm/GFfuioiFzjoWJ7zHB+0GY6jFrAIZxB0ORWJ/cPuUhvp+spzAhU6M8kSO1S7SZ0hv1XNdQFf9U9xDrDSSEZzx28t/disG2uOCUDcfLGX5C7sy/TlQgFt5QMyOVwXxDj8t+m9aFb7H8NHSWlZHSRcr96yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eAtXjzFMmtyexOsGjWPMK/Zll/6K1xkkpUaMYInQ6k=;
 b=GU2fnbjUsRGl1hlR33Zk8XEQTLf4MVFL5kOsrMrG3fQWi9wqoY9tE+E8/O/ziXYgTGmml8SOZ/tXJ/tPHD2+2aW6xWWF3sjcwE4TX7FyyeOBDLyawlrgNQhBxrugep0MJcXwlSixLJqyxCCG+Q8T5GUZuz73TtnYt9D7guvn844=
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 15:22:18 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::57) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.10 via Frontend Transport; Fri,
 24 Jan 2025 15:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 15:22:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Jan
 2025 09:22:15 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.14
Date: Fri, 24 Jan 2025 10:21:52 -0500
Message-ID: <20250124152153.3861868-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: 131f63cb-43d9-42a3-edaa-08dd3c8ae349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0pRczNsNHdkY09kaTRQRnRBcm52QUhoQUZHczdnR00vQVlTUGtCNDJaQjF0?=
 =?utf-8?B?NForQitYVnBNMm5WQ2FmeEY4VW9pTWRKTEJYOVgyN2xZeUxvd2sxUDZzVUo0?=
 =?utf-8?B?eVExMjZMR1Fwc21URHh3Y1JQdXRHcUtvR2pPalJORktCTUJiMmFNKzZ5V0ZU?=
 =?utf-8?B?ay9yb2Vzbm1sOFJwemsrUG5Sc3c2S3JhVkg5OWJXUHpMNEFHOHZyanJFNnBi?=
 =?utf-8?B?NW1qYnFMS1hxMkNrTUdMV01VMHBiVW9PRzRZajNMaDNkN2NnSHdqY0JvdnFM?=
 =?utf-8?B?VmkwN1NwWGliUXlHQysxbVErNEtFZ1o4RFVudGpYNFVFc2NuZENqSjZpOFcx?=
 =?utf-8?B?SVF0ZFRJMGRrQXBWNzdFSDBBOU1xd1c4Rzh6VEhKaWYxM3FrQ0FCTitkWWJr?=
 =?utf-8?B?YjNodERyY09EVlUySG8wNTNLWE1neUpxdzhtQThlVXRMcTB1b3hhQlVMR0ZF?=
 =?utf-8?B?ZWN2NTllT3lINmQ5RytCTmZMYktaM1Zha3BydVIvcUh5TGpuMHJiK2MxeFl3?=
 =?utf-8?B?MlpOQjJWejd5Mk1NQlMzV3FIWnhXaXhQbFRKUlMyN1Zwcno5RnRHdG5DUE8z?=
 =?utf-8?B?R0NmSFI2andldkE5L1NwN2U1UzgxYkdydmo0bVVUVGdoUVVlRWNicFdlMFM3?=
 =?utf-8?B?VmV2L01yWkQyeGgra1hSQTRSY2x6cjlYa040aTFZS1lCa0NsY3NiWk9CQ1U5?=
 =?utf-8?B?ZlBVTm1EeTUrQ1IxTUtSOFVLcC9NejNXOFpSYTZxeXFuZjBubXcwbUlacXBq?=
 =?utf-8?B?a1d3Y1JneW5YQUhiNjNieFRjdFFQWHFPL0NJVzhoOXRuWVdPVWlvbEkrOE9G?=
 =?utf-8?B?TUJkMVQyMHJxUDN0UWV3a2VBSkFWWUZlTEhCSWlZN1RqblZVV05TU0xNMm5o?=
 =?utf-8?B?WGZ4TzY1YUJQWTBpcWVQWldzM0RKdFRLT2tVUEt0WU9VOFhseVQyaFdYUnZE?=
 =?utf-8?B?Nks2dE9pS2hzQVh1RDFaR2M2YlNrWGdmM2lvbXZqWlM1WHR4L0laaGpQdDRM?=
 =?utf-8?B?RHh4MFFjeG9qaGRzbDErQk9WYmY1Y2VUOG9xYm0zZ3B2MGlLSWdzVTFLdkgw?=
 =?utf-8?B?Z1UwTm90YnNraVZUVEVPQ2dkSHNDOUs0Q1lPNElPNHlFTHN2cjA2UUwvejht?=
 =?utf-8?B?aG8xckJzRUVNQ1lvTC9nei90K1hLQ1MvdVZvVkxSNkpML0c2bTQ1OE1GbUxx?=
 =?utf-8?B?RTVyVEZlQUVCZzNETTFNYWljMEU2NWlPdnFLeEo0dG9uK2g5K3R3aEt1Snd2?=
 =?utf-8?B?V0RLa1h5cm1ldm01dDVUSmxWdEpFd1RsaEVnTFF2LzU0aE1LNCttb3NLaTJC?=
 =?utf-8?B?NThKMGh0RkIwSTdvOXN5N2NPeG9XOW0xZ0x4K3dEZnM3eFNmREJ4QURVT3hL?=
 =?utf-8?B?YXBvL0krS2M0WUpEaTZsRFR3clNjbDUzeHhEa2lZN2xEbnIzek90MW5ldVdv?=
 =?utf-8?B?c3Y5KzkxNnlVUXlkL1VxWVBiQTd2VmhWemNKUnoxc1hLbkdpa0VabEJ6VW1O?=
 =?utf-8?B?N01vcll1eG8yb2VYU3pXcFY1aG9NbnFwMy9oUDd1c3NTSW9vbXdUVUNPbm5N?=
 =?utf-8?B?Y0Rkand6cDhWYnpZRlZHU3oyWXNadUF2elNBcmFkU3FYc0dlNVQxUHFLVHo2?=
 =?utf-8?B?RHJ2MFRtczhla1lsS3FwTStBZGVrODZlT0ZWcXZzb0F0U1MvWkx2bmowNFNi?=
 =?utf-8?B?TjNWeFQxb2dXVTlJazhpRzUrY3Yyam9yRDVGcGN3NllOZkk2Vy9HNGMzYldu?=
 =?utf-8?B?czQ2Z2JibGJXc3p5bG9hdnNVSFhYZExLeVhMNWcwMFdHK3crZ3c3cEhhdkJR?=
 =?utf-8?B?Qy91emhMRnp2bDNnQ1g4aEk3OHpzOG1HWnBjYlZBWkpUVi85d0JEcWg1U05t?=
 =?utf-8?B?NitLaDdId2NZYWZsNEdyK3d4MlNVcGxkbjltOHBySTMwcStiYzdVVVU2WHQz?=
 =?utf-8?Q?faMC58X++y0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 15:22:17.2279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 131f63cb-43d9-42a3-edaa-08dd3c8ae349
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241
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

Fixes for 6.14 from last two weeks.  Fixed missing s-o-b.

The following changes since commit 24c61d553302ee49e9c21dd251275ba8c36dcfe4:

  Merge tag 'drm-msm-next-2025-01-07' of gitlab.freedesktop.org:drm/msm into drm-next (2025-01-13 11:14:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.14-2025-01-24

for you to fetch changes up to 024771f3fb75dc817e9429d5763f1a6eb84b6f21:

  drm/amd/display: Optimize cursor position updates (2025-01-24 09:56:28 -0500)

----------------------------------------------------------------
amd-drm-next-6.14-2025-01-24:

amdgpu:
- Documentation fixes
- SMU 13.x fixes
- SR-IOV fix
- Display fix
- PCIe calculation fix
- MES 12 fix
- HUBP fix
- Cursor fix
- Enforce isolation fixes
- GFX 12 fix
- Use drm scheduler API helper rather than open coding it
- Mark some debugging parameters as unsafe
- PSP 14.x fix
- Add cleaner shader support for gfx12
- Add subvp debugging flag
- SDMA 4.4.x fix
- Clarify some kernel log messages
- clang fix
- PCIe lane reporting fix
- Documentation fix

amdkfd:
- Mark some debugging parameters as unsafe
- Fix partial migration handling
- Trap handler updates

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: cache gpu pcie link width
      drm/amdgpu: fix the PCIe lanes reporting in the INFO IOCTL
      drm/amd/display: fix CEC DC_DEBUG_MASK documentation
      drm/amd/display: fix SUBVP DC_DEBUG_MASK documentation

Aric Cyr (2):
      drm/amd/display: Add hubp cache reset when powergating
      drm/amd/display: Optimize cursor position updates

Aurabindo Pillai (1):
      drm/amd: Add debug option to disable subvp

Christian König (2):
      drm/amdgpu: mark a bunch of module parameters unsafe
      drm/amdgpu: always sync the GFX pipe on ctx switch

Emily Deng (1):
      drm/amdkfd: Fix partial migrate issue

Gui Chengming (1):
      drm/amdgpu: fix fw attestation for MP0_14_0_{2/3}

Jay Cornwall (2):
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Clear MODE.VSKIP in gfx9 trap handler

Jesse.zhang@amd.com (3):
      revert "drm/amdgpu/pm: Implement SDMA queue reset for different asic"
      revert "drm/amdgpu/pm: add definition PPSMC_MSG_ResetSDMA2"
      drm/amd/pm: Refactor SMU 13.0.6 SDMA reset firmware version checks

Kenneth Feng (1):
      drm/amdgpu: disable gfxoff with the compute workload on gfx12

Kent Russell (1):
      drm/amdgpu: Mark debug KFD module params as unsafe

Lijo Lazar (4):
      drm/amdgpu: Add handler for SDMA context empty
      drm/amdgpu: Refine ip detection log message
      drm/amd/pm: Add capability flags for SMU v13.0.6
      drm/amd/pm: Fix smu v13.0.6 caps initialization

Lin.Cao (1):
      drm/amdgpu: fix ring timeout issue in gfx10 sr-iov environment

Mario Limonciello (1):
      drm/amd: Clarify kdoc for amdgpu.gttsize

Shaoyun Liu (1):
      drm/amd/amdgpu: Enable scratch data dump for mes 12

Srinivasan Shanmugam (4):
      drm/amdgpu: Fix Circular Locking Dependency in AMDGPU GFX Isolation
      drm/amdgpu/gfx12: Add Cleaner Shader Support for GFX12.0 GPUs
      drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed
      drm/amd/amdgpu: Prevent null pointer dereference in GPU bandwidth calculation

Tvrtko Ursulin (1):
      drm/amdgpu: Use DRM scheduler API in amdgpu_xcp_release_sched

Tzung-Bi Shih (1):
      drm/amd/display: mark static functions noinline_for_stack

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  156 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    8 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   49 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   22 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 2391 ++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    8 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   12 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   12 +-
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |   10 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |    6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |   10 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |    2 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |    9 +-
 .../drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c   |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |    3 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |    3 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    1 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   13 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    2 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    2 +
 drivers/gpu/drm/amd/include/amd_pcie.h             |   18 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    7 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    1 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  286 ++-
 40 files changed, 1743 insertions(+), 1400 deletions(-)
