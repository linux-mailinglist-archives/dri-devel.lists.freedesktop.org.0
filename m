Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4614D0B064
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3B510E8EE;
	Fri,  9 Jan 2026 15:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FMfzfOLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013001.outbound.protection.outlook.com
 [40.93.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6A10E8EE;
 Fri,  9 Jan 2026 15:47:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buf1JRPHS3IQmucZXutEInMI4PP5sO2hLtxcC6euqrFl8ouBw5t0icWqpoh4o8HQurricFHt6F+EfILPYgv5xyCN88uUrZp+jUEAShLWwpfCNkUsAQrAmIbrHEaXEZCredoM/FMyWLqFb40pWmL7TEFDTkmVPNYC5RMCiOzM6O/PvzKEJyjnYIVlBPqSYTNCS3fmGqNiOi1j3TS5IcwB+lzB+D+c05VJU1IDrsJpQ+Os8ul81dVP7X0odEdt7UKvhrMGN+UjFJ+zu0vDGX+qMDOV3j5XvdfjflJnMxL3+Kf+OGaeMtX5dngRXcXyAMOnMXIGn9jjSiOrJeIFPDomBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwkPNP8/25riLv3XhV2qia0DwyR8PQZ1rf9jWQVVp20=;
 b=Xw1Nz6P6sUg09VILDklaGb7Up0vNiJvtI9VyolNjJO493LGGJ91jCZs0JX7AHUCZu1f3n5k7fZJMfM+z3lL1aAqhfRvsXY41iROU0Ku8dK48UKtsjHcCZJyplR6UzQcP0Ve/5+x97e04ZXrmQ9/qQxgRXag7dunqx4Tppupg+LP0abVRUhpvwtMO2ln89uQnEYFvnORoSRptvzD+c7lHFKRUQ5bH61G4QuArO5k9B4Fd87AAZE1IoqjC3hUUYVjXiIszd6vcyxzy5Zpf8Mjg6e/rclARnGMyhRCV6GfwZPUztnYlnWNUDJ9k3MBflzYttCw9r1+LnQif2kSVoFqIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwkPNP8/25riLv3XhV2qia0DwyR8PQZ1rf9jWQVVp20=;
 b=FMfzfOLGq6wal4d6Svxo3oZCmnZ3bXx0OflAlNrIVPISRwAfBaBjlqUeF7BY9TCIaC9sY8H4S8NObIW33Qy7huMh8THKnRaSnCemlxPZqKxyLqSPRy9aFSwDFBO8S0RjcKRqX6eSBCk5EuVOinWljHaLYE7cMXHD8cPCpByOHiw=
Received: from BN9PR03CA0431.namprd03.prod.outlook.com (2603:10b6:408:113::16)
 by SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 15:47:26 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::89) by BN9PR03CA0431.outlook.office365.com
 (2603:10b6:408:113::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 15:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 15:47:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 09:47:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 09:47:25 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 09:47:25 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.20
Date: Fri, 9 Jan 2026 10:47:11 -0500
Message-ID: <20260109154713.3242957-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c11c1b-9407-4a7f-feac-08de4f96636e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm1UVnorQXhIMFJ4SHVJa0x4S2NIMDROZmZYc0w0UUJMOGFBcXBKamU5ckgv?=
 =?utf-8?B?UjdmVDhYNDdaNHlRZ0lqU1F2YVNMNDU0M0FlMDl2Vy9SVlQ1UHFsaWlOekdS?=
 =?utf-8?B?cTFrdGgxQ3daQUFJbDcvNWRNNlRXQ0NMVHVwYWVnRXpUOXJYV0RMZlQvWFhs?=
 =?utf-8?B?L21uRlhQSjU5NjJHalRjTXh0MUwycXhWbnpncm5QQ0JhVVJuMFRCaUZoWTNi?=
 =?utf-8?B?UkFwTERZajRWUUtDb1lxeENQTFg1WEtlQjNGeDR0YjNFR1lJYkFJRjkwb1hl?=
 =?utf-8?B?TmxvVmdjOVRBK3V6bUlLbDJRUEZRREo0dk1JRzlBQVEyNG40YWFpTUxCckpP?=
 =?utf-8?B?bXlkRk54MlplOGVHb0JIL2V6dmU3M2FIYWFMM3NWLysvYXFnbEtTN2Zyc3VN?=
 =?utf-8?B?N1NSNnlnYnR6Ym52Rzk1K1Z4ZC9jWS9wM2U2dTV5ZG9lNlM4bVV6VUg2WGx4?=
 =?utf-8?B?c0lHYkYvNXQxSWV3UHhlVkxkT1Y5NC96MjNRZjVzWGF1dkVBVWtLc2ZNLzZQ?=
 =?utf-8?B?a3AyMVpBSmRoS2RSWEZ6Tmo2RnhYbkVSRTFrQno2cjllaHRlT3d2eEJ5WElo?=
 =?utf-8?B?MzdNOU9MODA4TXBKVHlPVDFDMHM4VHcvbzllbXJFTDFUcWI5MzdBSWZNamZL?=
 =?utf-8?B?T3NGSlFEak0rWVBVWTAyaS9SNDJWUXE1RmEwbVhhQmdlNWdhM0FDWWlZUDRM?=
 =?utf-8?B?bFM2MVQ2MWlObWt0U2p1enpyUDBWVlhxKzdYN0xWOUlaRXl1bC9ERklkY1g2?=
 =?utf-8?B?bm4xVzJTMDVOVWNqcTRkdWJwN0ZkVnBlR0lNYlJ1UkNsV2RzMmZuanUrWkEz?=
 =?utf-8?B?a3I5Mzlwa056ZXgweE1ncUZMOXc3b2EyK2VDU0hKTHJhN0JraVZ0c3R6UU4w?=
 =?utf-8?B?T3N0N1IydGMxaXUvNGk0cEc5NTY3djI1V3JncDZJaTNPeHM2YlRRcGdsdTNH?=
 =?utf-8?B?SmQ3UVhLWVAvK1F2RWV3UlRDOW1yRUF5OFZjVTAzcGlnT2YxbzdlSUVHbWNM?=
 =?utf-8?B?dkxlRjYxYU9ZeDRTcHcxZmRWWEh4bUxHRWd0c294M05SNEduT1JPMk1JN2Zo?=
 =?utf-8?B?OVZjTlNENmJyYnFUVnE0U0cyU1gxNDFVbXVDRnBadnYzU3lXaW1abWtMRUtt?=
 =?utf-8?B?ZVVjL3UvTC9sN1FUUitZZFRCb1RBUWp1dVJ0Q0FlWnQ1T0xTVDZVSk9nNmZ2?=
 =?utf-8?B?bEtqSFY5cWE3NXJETEVuQzRyLzFMdjBxUXp4bzJrbEVmOFNaU3RuWnlpK0Jk?=
 =?utf-8?B?R0xFQUdSWGVtVjc4OGE4UjExUDlKcGFIZ3RoMDJidkx4THl2cTlRNThrdEJ4?=
 =?utf-8?B?cStQOGFNdCswY2F2Rm41Wm4wUlk0SC95YkpSZWJDRXQzdWkwMFh5YWJQUFVr?=
 =?utf-8?B?MlY5dWhkMkpoTXhIZk8vaTdHcStWdlVxcXhzbkpQNTJZZHhkdVlvSitsRGwv?=
 =?utf-8?B?MU1xbXFsaGIvZFRleG4raTEzQTdWNklEVFdvZ3lDS3pXOTVXVkhlMU9XMEd1?=
 =?utf-8?B?Q09Ka3BMVEgrMExUZW9HeEtadU1UWHBFUnpMa3hQTVllTlRWQTIrRWtlZENv?=
 =?utf-8?B?b0FUVm9RYmdZNm1rdXdnTkZ1ajVuZVJqTkZJbWJWMGpISFIrajl1S0JxT3dk?=
 =?utf-8?B?VFZNZGpMSEhtRU1KV21Va0hSQlpjK3V1ZDRQZFdUYUZ0dVovV3JaczY1MjJI?=
 =?utf-8?B?djEzVmJVYmsydkNFK0FidzFtUTVIYm9UMEZxdElXaXZlYlFUVUo2SjFJNVkw?=
 =?utf-8?B?cU1xbG9MaElmSnhQRmNKVVU0emhqUVNZdGxzVkRFK090VzB2azQrZG95TXZC?=
 =?utf-8?B?N3YrSnhUVGZXQ0ZqbFgyK3BhcHZ0SzNXUXM5ZFVobWtKMC9YK3dpdmEweXFn?=
 =?utf-8?B?YjAxcmtKUzFwdTBIV1RzY0Qzd09HQThUQzBkSDUwT0VIc3RFbmk1dEVwbkdE?=
 =?utf-8?B?ZkZhYVhEOVllZU9tbmFkazVsdzgxblNKRzI3eDZ3cDBGSzl0S2Z6U0JOZkxs?=
 =?utf-8?B?ZTZPekRQSWtGTTF5OXY1V0lqbmlTNUkzYWpua2RyMm5xQVhqQ2Z5MmFhZita?=
 =?utf-8?Q?QjnUqQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7142099003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:47:26.4668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c11c1b-9407-4a7f-feac-08de4f96636e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809
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

New stuff for 6.20.

The following changes since commit c7685d11108acb387e44e3d81194d0d8959eaa44:

  Merge tag 'topic/drm-intel-plane-color-pipeline-2025-12-04' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-12-05 10:27:57 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-01-09

for you to fetch changes up to 38a0f4cf8c6147fd10baa206ab349f8ff724e391:

  Revert duplicate "drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces" (2026-01-08 15:18:13 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-01-09:

amdgpu:
- GPUVM updates
- Initial support for larger GPU address spaces
- Initial SMUIO 15.x support
- Documentation updates
- Initial PSP 15.x support
- Initial IH 7.1 support
- Initial IH 6.1.1 support
- SMU 13.0.12 updates
- RAS updates
- Initial MMHUB 3.4 support
- Initial MMHUB 4.2 support
- Initial GC 12.1 support
- Initial GC 11.5.4 support
- HDMI fixes
- Panel replay improvements
- DML updates
- DC FP fixes
- Initial SDMA 6.1.4 support
- Initial SDMA 7.1 support
- Userq updates
- DC HPD refactor
- SwSMU cleanups and refactoring
- TTM memory ops parallelization
- DCN 3.5 fixes
- DP audio fixes
- Clang fixes
- Misc spelling fixes and cleanups
- Initial SDMA 7.11.4 support
- Convert legacy DRM logging helpers to new drm logging helpers
- Initial JPEG 5.3 support
- Add support for changing UMA size via the driver
- DC analog fixes
- GC 9 gfx queue reset support
- Initial SMU 15.x support

amdkfd:
- Reserved SDMA rework
- Refactor SPM
- Initial GC 12.1 support
- Initial GC 11.5.4 support
- Initial SDMA 7.1 support
- Initial SDMA 6.1.4 support
- Increase the kfd process hash table
- Per context support
- Topology fixes

radeon:
- Convert legacy DRM logging helpers to new drm logging helpers
- Use devm for i2c adapters
- Variable sized array fix
- Misc cleanups

UAPI:
- KFD context support.  Proposed userspace:
  https://github.com/ROCm/rocm-systems/pull/1705
  https://github.com/ROCm/rocm-systems/pull/1701
- Add userq metadata queries for more queue types.  Proposed userspace:
  https://gitlab.freedesktop.org/yogeshmohan/mesa/-/commits/userq_query

----------------------------------------------------------------
Abhishek Rajput (1):
      drm/radeon: Convert legacy DRM logging in evergreen.c to drm_* helpers

Alan Liu (1):
      drm/amdgpu: Fix query for VPE block_type and ip_count

Alex Deucher (21):
      drm/amdgpu: fix spelling in gmc9/10 code
      drm/amdgpu: add a helper for processing recoverable GPUVM faults
      drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
      drm/amdgpu: don't attach the tlb fence for SI
      drm/amdgpu/gfx: add eop size and alignment to shadow info
      drm/amdgpu/sdma: add query for CSA size and alignment
      drm/amdgpu: fix a job->pasid access race in gpu recovery
      drm/amdgpu: Update AMDGPU_INFO_UQ_FW_AREAS query for compute
      drm/amdgpu: Update AMDGPU_INFO_UQ_FW_AREAS query for sdma
      drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
      drm/amdgpu: add VCN 5.3.0 headers
      drm/amdgpu: add queue reset support for jpeg 5.3
      drm/amdgpu: add MP 15.0.0 headers
      drm/amdgpu: don't reemit ring contents more than once
      drm/amdgpu: always backup and reemit fences
      drm/amdgpu: use dma_fence_get_status() for adapter reset
      drm/amdgpu: avoid a warning in timedout job handler
      drm/amdgpu/gfx9: rework pipeline sync packet sequence
      drm/amdgpu/gfx9: Implement KGQ ring reset
      drm/amdgpu: add SMUIO 15.0.0 headers
      drm/amdgpu: Add THM 15.0.0 headers

Alex Hung (5):
      drm/amd/display: Refactor dml_core_mode_support to reduce stack frame
      drm/amd/display: Update function name to link_detect_connection_type_analog
      drm/amd/display: Update dc_connection_dac_load to dc_connection_analog_load
      drm/amd/display: Check NULL before calling dac_load_detection
      drm/amd/display: Replace log macro for analog display detection

Alex Sierra (2):
      drm/amd: include rrmt mode for mes_v12_1
      drm/amdgpu: update sh mem base offsets for gfx 12.1

Andrew Martin (1):
      drm/amdkfd: Uninitialized and Unused variables

Ard Biesheuvel (1):
      drm/amd/display: Permit DC_FP_START/END only in non-FP compilation units

Asad Kamal (7):
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Add sysfs node for ubb power
      drm/amd/pm: Fetch ubb power for smu_v13_0_12
      drm/amd/pm: Enable system power caps for smu_v13_0_12
      drm/amdgpu/ras: Move ras data alloc before bad page check
      drm/amd/amdgpu: Move enum for VDD board
      drm/amdgpu: Add sysfs up clean for gfx_v12_1

Austin Zheng (1):
      drm/amd/display: Fix presentation of Z8 efficiency

Bagas Sanjaya (2):
      drm/amd/display: Don't use kernel-doc comment in dc_register_software_state struct
      drm/amdgpu: Describe @AMD_IP_BLOCK_TYPE_RAS in amd_ip_block_type enum

Ben Dooks (1):
      drm/radeon: fix signed v unsigned print formats

Bokun Zhang (1):
      drm/amdgpu: RLC-G VF Register Access Interface

Brian Kocoloski (1):
      drm/amdkfd: Fix improper NULL termination of queue restore SMI event string

Candice Li (2):
      drm/amdgpu: Add vram_type to ras init_flags
      drm/amd/ras: Add vram_type to ras_ta_init_flags

Charlene Liu (4):
      drm/amd/display: add register definitions in dcn_hubbub_registers
      drm/amd/display: Fix DP no audio issue
      drm/amd/display: DPP low mem pwr related adjustment -Part I
      drm/amd/display: Fix dsc eDP issue

ChunTao Tso (2):
      drm/amd/display: Replay Video Conferencing V2
      drm/amd/display: Add frame skip feature support flag

Clay King (1):
      drm/amd/display: Update timing source enums

Colin Ian King (1):
      drm/amdkfd: Fix a couple of spelling mistakes

Cruise Hung (1):
      drm/amd/display: Remove unnecessary divider update flag

David Yat Sin (1):
      drm/amdkfd: Add metadata ring buffer for compute

Derek Lai (1):
      drm/amd/display: Write default Vesa Aux backlight control in dmub

Dillon Varone (4):
      drm/amd/display: Guard FAMS2 configuration updates
      drm/amd/display: Remove periodic detection callbacks from dcn35+
      drm/amd/display: Consolidate dmub fb info to a single struct
      drm/amd/display: Add new fields to fams2 config

Dmytro Laktyushkin (2):
      drm/amd/display: refactor HPD to increase flexibility
      drm/amd/display: Add signal type check for dcn401 get_phyd32clk_src

Dominik Kaszewski (2):
      drm/amd/display: Split update_planes_and_stream_v3 into parts (V2)
      drm/amd/display: Fix and reenable UPDATE_V3_FLOW_NEW_CONTEXT_MINIMAL

Ed Maste (1):
      drm/amd/amdgpu: Add missing newline in DRM_DEBUG_DRIVER message

Erick Karanja (1):
      drm/radeon : Use devm_i2c_add_adapter instead of i2c_add_adapter

Feifei Xu (3):
      drm/amdgpu: Add rlcv firmware for frontdoor loading.
      drm/amdgpu: update psp_get_fw_type() function
      drm/amdgpu: init RS64_MEC_P2/P3_STACK for gfx12.1

Fudong Wang (1):
      drm/amd/display: Set enable_legacy_fast_update to false for DCN35/351

Gang Ba (2):
      drm/amdkfd: Set SDMA_QUEUEx_IB_CNTL/SWITCH_INSIDE_IB
      drm/amdkfd: Add SDMA queue quantum support for GFX12.1

Gangliang Xie (1):
      drm/amdgpu: only check critical address when it is not reserved

Harry Wentland (4):
      drm/amd/display: Rename dml2_wrapper.c to dml2_wrapper_fpu.c
      drm/amd/display: Move dml2_validate to the non-FPU dml2_wrapper
      drm/amd/display: Move dml2_create and init to the non-FPU dml2_wrapper
      drm/amd/display: Drop FPU flags from dml21_wrapper.c

Hawking Zhang (43):
      drm/amdgpu: Increase the maximum number of IP instances
      drm/amdgpu: Add hwid for ATU
      drm/amdgpu: Add hwid for AIGC
      drm/amdgpu: Verify dpm setting for enabling smu with direct fw loading
      drm/amdgpu: Move XCP_INST_MASK amdgpu_xcp.h
      drm/amdgpu: update VRAM types
      drm/amdgpu: Add soc v1_0 enum header
      drm/amdgpu: Add smuio v15_0_8 ip headers v4
      drm/amdgpu: Add smuio v15_0_8 support v4
      drm/amdgpu: Initialize smuio functions for smuio v15_0_8
      drm/amdgpu: Add mp v15_0_8 ip headers v4
      drm/amdgpu: Set skip_tmr to true for psp v15_0_8
      drm/amdgpu: Upload a single sdma fw copy when using psp v15.0.8
      drm/amdgpu: Use ih v7_0 ip block for ih v7_1
      drm/amdgpu: Add mmhub v4_2_0 ip headers v5
      drm/amdgpu: Add osssys v7_1_0 ip headers v3
      drm/amdgpu: Add gc v12_1_0 ip headers v4
      drm/amdgpu: Add gfxhub v12_1 support
      drm/amdgpu: Add gmc v12_1 gmc callbacks
      drm/amdgpu: Add soc v1_0 support
      drm/amdgpu: Include the correct pkt header for gfx v12_1
      drm/amdgpu: Init single mes instance if xcc_mask is unset
      drm/amdgpu: Remove redundant pmfw backdoor loading
      drm/amdgpu: Remove redundant check for async_gfx_ring
      drm/amdgpu: Implement gfx_v12_1_get_xccs_per_xcp
      drm/amdgpu: Add switch_compute_partition callback for imu v12_1
      drm/amdgpu: Export gfx_v12_1_xcp_func
      drm/amdgpu: Export sdma_v7_1_xcp_funcs
      drm/amdgpu: Add soc_v1_0_xcp_funcs
      drm/amdgpu: Initialize xcp manager for soc v1_0
      drm/amdgpu: Enable atomics for all the available xcc
      drm/amdgpu: Initialize memory partition callbacks for gmc v12_1
      drm/amdgpu: Initialize memory ranges for gmc v12_1
      drm/amdgpu: Init compute partition mode for gfx v12_1
      drm/amdgpu: Initialize vram_info for gmc v12_1
      drm/amdgpu: Init partition_mode and xcc_mask for GFX_IMU_PARTITION_SWITCH
      drm/amdgpu: Set xcp id for mes ring
      drm/amdgpu: Add soc v1_0 ih client id table
      drm/amdgpu: Add gfx v12_1 interrupt source header
      drm/amdgpu: Do not initialize imu callback for vf
      drm/amdgpu: Fix xcc_id input for soc_v1_0_grbm_select
      drm/amdgpu: Init mcm_addr look up table
      drm/amdgpu: Extend psp_skip_tmr for bare-metal and sriov

Ivan Lipski (3):
      drm/amd/display: Improve HDMI info retrieval
      drm/amd/display: Remove unused encoder types
      drm/amd/display: Use local variable for analog_engine initialization

Jack Chang (6):
      drm/amd/display: Refactor panel replay set dmub cmd flow
      drm/amd/display: Add AS-SDP v2 support for eDP feature
      drm/amd/display: Parse debug flag to PR FW
      drm/amd/display: Fix sending redundant enable command to dmub
      drm/amd/display: Revise VSC SDP header for Panel Replay
      drm/amd/display: Refactor panel replay dc libs

Jack Xiao (7):
      drm/amdgpu/mes: add multi-xcc support
      drm/amdgpu: add new compute/mes mqd structure
      drm/amdgpu/mes_v12_1: initial support for mes_v12_1
      drm/amdgpu: Add mes v12_1_0 to discovery list
      drm/amdgpu/mes12_1: add cooperative dispatch support
      drm/amdgpu/mes_v12_1: fix mes access xcd register
      drm/amdgpu/gfx_v12_1: add mqd_stride_size input parameter

James Zhu (1):
      drm/amdkfd: refactor rlc/gfx spm

Jay Cornwall (3):
      drm/amdkfd: Trap handler support for expert scheduling mode
      drm/amdkfd: Fix VGPR bank state save in gfx12.1 trap handler
      drm/amdkfd: Apply VGPR bank state fixup on gfx12.1 trap exit

Jing Zhou (1):
      drm/amd/display: Correct FIXED_VS Link Rate Toggle Condition

Jinzhou Su (3):
      drm/amd/ras: Support physical address convert
      drm/amdgpu: Add address checking for uniras
      drm/amd/ras: Replace NPS flags in ras module

Jonathan Kim (5):
      drm/amdkfd: bump minimum vgpr size for gfx1151
      drm/amdkfd: disable shader message vgpr deallocation on gc 12.1
      drm/amdkfd: allow debug subscription to lds violations on gfx 1250
      drm/amdkfd: fix partitioned gfx12 address watch enablement
      drm/amdkfd: enable precise memory operations for gfx1250

Joshua Aberback (1):
      drm/amd/display: Defer transitions from minimal state to final state

Julia Lawall (2):
      drm/amdgpu: update outdated comment
      drm/amdkfd: update outdated comment

Kaier Hsueg (1):
      drm/amd/display: Fix P010, NV12, YUY2 scale down by four times failure

Lang Yu (1):
      drm/amdgpu/gfx12.1: Don't fetch default register values from hardware in mqd init

Le Ma (9):
      drm/amdgpu: Add psp v15.0.8 ip block v3
      drm/amdgpu: Set psp ip block and funcs for v15.0.8
      drm/amdgpu: add soc v1_0 common block for IP discovery
      drm/amdgpu: remove hdp flush/invalidation completely for gfx12.1.0/sdma7.1.0
      drm/amdgpu: Use AMDGPU_IS_GFXHUB to screen out GFXHUB for GMC v12.1
      drm/amdgpu: flush tlb properly for GMC v12.1 in early phase
      drm/amdgpu: enable CP interrupt for gfx v12_1 in frontdoor loading case
      drm/amdgpu: reserve umf hole size at vram high end for gfx v12.1
      drm/amdgpu: add helpers to access cross-die registers smn addr for soc v1_0

Lijo Lazar (52):
      drm/amdgpu: Change user queue interface signatures
      drm/amdgpu: Clean up userq helper functions
      drm/amdgpu: Rename userq_mgr_xa to userq_xa
      drm/amdgpu: Make pre_asic_init optional
      drm/amd/pm: Remove print_clk_levels from navi10
      drm/amd/pm: Use emit_clk_levels in sienna_cichild
      drm/amd/pm: Use emit_clk_levels in cyan skillfish
      drm/amd/pm: Use emit_clk_levels in vangogh
      drm/amd/pm: Use emit_clk_levels in renoir
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.0
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.4
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.5
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.6
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.7
      drm/amd/pm: Use emit_clk_levels in yellow carp
      drm/amd/pm: Use emit_clk_levels in SMUv14.0.0
      drm/amd/pm: Use emit_clk_levels in SMUv14.0.2
      drm/amd/pm: Use emit_clock_levels in SMUv7.0
      drm/amd/pm: Use emit_clock_levels in SMUv8.0
      drm/amd/pm: Use emit_clock_levels in SMUv10.0
      drm/amd/pm: Use emit_clock_levels in vega10
      drm/amd/pm: Use emit_clock_levels in vega12
      drm/amd/pm: Use emit_clock_levels in vega20
      drm/amd/pm: Deprecate print_clock_levels interface
      drm/amd/pm: Add clock table structure
      drm/amd/pm: Use generic dpm table for SMUv11 SOCs
      drm/amd/pm: Use generic dpm table for SMUv13 SOCs
      drm/amd/pm: Use generic dpm table for SMUv14 SOCs
      drm/amd/pm: Add generic pcie dpm table
      drm/amd/pm: Use generic pcie dpm table for SMUv11
      drm/amd/pm: Use generic pcie dpm table for SMUv13
      drm/amd/pm: Use generic pcie dpm table for SMUv14
      drm/amd/pm: Add a helper to show dpm table
      drm/amd/pm: Use common helper for arcturus dpm
      drm/amd/pm: Use common helper for navi10 dpm table
      drm/amd/pm: Use common helper for sienna dpm table
      drm/amd/pm: Use common helper for aldebaran dpm table
      drm/amd/pm: Use common helper for smuv13.0.0 dpm
      drm/amd/pm: Use common helper for smuv13.0.6 dpm
      drm/amd/pm: Use common helper for smuv13.0.7 dpm
      drm/amd/pm: Use common helper for smuv14.0.2 dpm
      drm/amdgpu: Move ip block related functions
      drm/amdgpu: Use helper to get ip block
      drm/amdgpu: Change set ip clock/power gating param
      drm/amd/pm: Add smu driver table structure
      drm/amd/pm: Use driver table structure in smuv11
      drm/amd/pm: Use driver table structure in smuv12
      drm/amd/pm: Use driver table structure in smuv13
      drm/amd/pm: Use driver table structure in smuv14
      drm/amd/pm: Use cached gpu metrics table
      drm/amd/pm: Use driver table for board temperature
      drm/amd/pm: Return right size for gpuboard metrics

Likun Gao (44):
      drm/amdgpu: fix NULL pointer issue buffer funcs
      drm/amdgpu: fix NULL pointer issue for supports_baco
      drm/amdgpu: Add initial support for mmhub v4_2
      drm/amdgpu: Add gmc v12_1 support
      drm/amdgpu: Add gmc v12_1_0 to discovery list
      drm/amdgpu: create pkt header for sdma v7_1
      drm/amdgpu: Add sdma v7_1_0 support
      drm/amdgpu: add support for sdma v7_1
      drm/amdgpu: Set GC family for GC 12.1
      drm/amdgpu: create pm4 header for gc v12_1
      drm/amdgpu: Add initial support for gfx v12_1
      drm/amdgpu: Add gfx v12_1_0 to discovery list
      drm/amdgpu: update rlc autoload function
      drm/amdgpu: only set XCC 0 related reg for rlc autoload
      drm/amdgpu: skip SDMA autoload copy if not initialized
      drm/amdgpu: add soc config init for GC v12_1
      drm/amdgpu: add xcc info for compute ring name
      drm/amdgpu: set gfxhub according xcc_mask for gfx 12_1
      drm/amdgpu/gmc12: set MMHUBs based on aid_mask
      drm/amdgpu: fix mes code error for muti-xcc
      drm/amdgpu: add imu support for gc 12_1
      drm/amdgpu: revision doorbel range for gfx v12_1
      drm/amdgpu: enable unmap doorbell handle for gfx v12_1
      drm/amdgpu: disable graphics doorbell range for gfx v12_1
      drm/amdgpu: update sdma configuration for soc v1_0
      drm/amdgpu: support rlc autoload for muti-xcc
      drm/amdgpu: only copy ucode for enabled xcc
      drm/amdgpu: enable gpu tlb flush for gfxhub
      drm/amdgpu: Correct xcc_id input to GET_INST from physical to logic
      drm/amdgpu: use physical xcc id to get rrmt
      drm/amdgpu: Correct inst_id input from physical to logic
      drm/amdgpu: support xcc harvest for ih translate
      drm/amdgpu: normalize reg addr as local xcc for gfx v12_1
      drm/amdgpu: add gfx sysfs support for gfx_v12_1
      drm/amdgpu: correct rlc autoload for xcc harvest
      drm/amdgpu: disable burst for gfx v12_1
      drm/amdgpu: adjust xcc_cp_resume function for gfx_v12_1
      drm/amdgpu: adjust xcc logic for gfxhub v12_1
      drm/amdgpu: adjust xcc_id program logic for sdma v7_1
      drm/amdgpu: make normalize reg addr to common func for soc v1
      drm/amdgpu: update mcm_addr_lut data for imu v12_1
      drm/amdkfd: Add gfx_v12_1_kfd2kgd interface for GFX12_1
      drm/amdgpu: skip gfxhub tlb flush if gfx is power off
      drm/amdgpu: set aid_mask for soc v1

LinCheng Ku (1):
      drm/amd/display: Add USB-C DP Alt Mode lane limitation in DCN32

Lu Yao (1):
      drm/amdgpu: fix drm panic null pointer when driver not support atomic

Mario Limonciello (3):
      amdkfd: Bump ABI to indicate presence of Trap handler support for expert scheduling
      drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
      Revert "drm/amd/display: Fix pbn to kbps Conversion"

Mario Limonciello (AMD) (16):
      drm/amd/display: Improve readability of link_detect_sink_signal_type
      drm/amd/display: Move CONNECTOR_ID_PCIE into switch/case
      drm/amd/display: Drop needless check for link->link_id.id
      drm/amd/display: Correct comment style
      drm/amd: Fix unbind/rebind for VCN 4.0.5
      drm/amd: Resume the device in thaw() callback when console suspend is disabled
      drm/amd: Drop "amdgpu kernel modesetting enabled" message
      drm/amdkfd: Correct the topology message for APUs
      drm/amd: Add correct prefix for VBIOS message
      drm/amd: Pass `adev` to amdgpu_gfx_parse_disable_cu()
      drm/amd: Drop dev_fmt prefix
      drm/amd/display: Fix DPMS log printing
      drm/amd: Convert amdgpu_display from DRM_* to drm_ macros
      drm/amd: Drop amdgpu prefix from message prints
      drm/amd: Convert DRM_*() to drm_*()
      drm/amd: Clean up kfd node on surprise disconnect

Michael Chen (2):
      drm/amdgpu/mes12_1: set multi-xcc mes log address
      drm/amdgpu: Fix CP_MEC_MDBASE in multi-xcc for gfx v12_1

Mukesh Ogare (2):
      drm/radeon: Convert logging in radeon_display.c to drm_* helpers
      drm/radeon: convert UVD v1.0 logging to drm_* helpers

Mukul Joshi (45):
      drm/amdkfd: Rework reserved SDMA queue handling
      drm/amdgpu: update soc15 IH client ids
      drm/amdgpu: add PCIe atomics bit in PTE
      drm/amdgpu: Generalize HQD and VMID mask calculation for MES
      drm/amdgpu: Enable IH CAM on IH 7.1.0
      drm/amdgpu: Add per-ASIC PTE init flag
      drm/amdgpu: Always set snoop bit in PDE on GFX 12.1
      drm/amdgpu: Enable PDE.C usage on GFX 12.1
      drm/amdkfd: Fix PTE clearing during SVM unmap on GFX 12.1
      drm/amdgpu: Update Generate PTE/PDE SDMA packet for SDMA 7.1
      drm/amdkfd: Add SDMA 7.1.0 support in KFD
      drm/amdgpu: Fix golden register init for GFX 12.1.0
      drm/amdgpu: Setup Atomics enable in TCP UTCL0 for GFX 12.1.0
      drm/amdgpu: Setup PCIe atomics bit in PTE on GFX 12.1.0
      drm/amdkfd: Add GFX 12.1.0 support in KFD
      drm/amdkfd: Add MQD manager for GFX 12.1.0
      drm/amdkfd: Add interrupt handling for GFX 12.1.0
      drm/amdgpu: Fix SHMEM alignment mode for GFX 12.1.0
      drm/amdgpu: Setup MTYPEs for GFX 12.1.0
      drm/amdgpu: Revert retry based thrashing prevention on GFX 12.1.0
      drm/amdgpu: Add UTCL2 Retry fault interrupt for GFX 12.1
      drm/amdgpu: Add interrupt handler for GFX 12.1.0
      drm/amdgpu: Add IH node-id to XCC mapping
      drm/amdgpu: Enable retry faults for GFX 12.1
      drm/amdkfd: Enable per-process XNACK for GFX 12.1.0
      drm/amdgpu: Update MES VM_CNTX_CNTL for XNACK off for GFX 12.1
      drm/amdgpu: Flush TLB on all XCCs on GFX 12.1
      drm/amdkfd: Update CWSR area calculations for GFX 12.1
      drm/amdgpu: Fix CU info calculations for GFX 12.1
      drm/amdkfd: Override KFD SVM mappings for GFX 12.1
      drm/amdgpu: Program IH_VMID_LUT_INDEX register on GFX 12.1
      drm/amdgpu: Setup Retry based thrashing prevention on GFX 12.1
      drm/amdgpu: Use correct MES pipe in non-SPX mode on GFX 12.1
      drm/amdgpu: Rework MES initialization on GFX 12.1
      drm/amdkfd: Don't partition VMID space on GFX 12.1
      drm/amdkfd: Add/remove queues on the correct XCC on GFX 12.1
      drm/amdkfd: Send MES packets on correct XCC on GFX 12.1
      drm/amdgpu: Report correct compute partition mode on GFX 12.1
      drm/amdgpu: Setup MTYPE on SOC models for GFX 12.1
      drm/amdgpu: Always set PTE.B for device memory on GFX 12.1
      drm/amdkfd: Implement CU Masking for GFX 12.1
      drm/amdgpu: Disable TCP Early Write Ack for GFX 12.1
      drm/amdgpu: Cleanup gmc_v12_1 after 6.16 merge
      drm/amdkfd: Add back CWSR trap handler for GFX 12.1
      drm/amdgpu: Update TCP Control register on GFX 12.1

Nathan Chancellor (3):
      drm/amd/display: Apply e4479aecf658 to dml
      drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dcn30's CalculateWatermarksAndDRAMSpeedChangeSupport()

Navid Assadian (1):
      drm/amd/display: Add configurable SPL namespace prefix

Nevenko Stupar (2):
      drm/amd/display: Add additional info from DML
      drm/amd/display: Additional info from DML for DMU

Nicholas Kazlauskas (3):
      drm/amd/display: Fix wrong x_pos and y_pos for cursor offload
      drm/amd/display: Reset pipe mask at beginning of cursor offload
      drm/amd/display: Fix mismatched unlock for DMUB HW lock in HWSS fast path

Oleh Kuzhylnyi (1):
      drm/amd/display: Add use_max_lsw parameter

Ovidiu Bunea (2):
      drm/amd/display: Add additional checks for PSP footer size
      drm/amd/display: Fixes for S0i3 exit

Peichen Huang (1):
      drm/amd/display: Don't disable DPCD mst_en if sink connected

Perry Yuan (1):
      drm/amd/pm: Disable MMIO access during SMU Mode 1 reset

Peter Colberg (1):
      Revert duplicate "drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces"

Philip Yang (9):
      drm/amdgpu: GPU vm support 5-level page table
      drm/amdgpu: Update vm start, end, hole to support 57bit address
      drm/amdkfd: Handle GPU reset and drain retry fault race
      drm/amdgpu: Enable 5-level page table for GFX 12.1.0
      drm/amdkfd: Update LDS, Scratch base for 57bit address
      drm/amdgpu: Add pde3 table invalidation request for GFX 12.1.0
      drm/amdgpu: Support 57bit fault address for GFX 12.1.0
      drm/amdgpu: Fix gfx9 update PTE mtype flag
      drm/amdgpu: Add helper to alloc GART entries

Pierre-Eric Pelloux-Prayer (7):
      drm/amdgpu: remove direct_submit arg from amdgpu_copy_buffer
      drm/amdgpu: remove the ring param from ttm functions
      drm/amdgpu: introduce amdgpu_ttm_buffer_entity
      drm/amdgpu: add amdgpu_ttm_job_submit helper
      drm/amdgpu: fix error handling in amdgpu_copy_buffer
      drm/amdgpu: pass the entity to use to amdgpu_ttm_map_buffer
      drm/amdgpu: pass the entity to use to ttm public functions

Pratap Nirujogi (1):
      drm/amd/amdgpu: Fix SMU warning during isp suspend-resume

Pratik Vishwakarma (4):
      drm/amdgpu: Enable support for PSP 15_0_0
      drm/amd: Enable SMUIO 15_0_0 support
      drm/amd: Enable SMU 15_0_0 firmware headers
      drm/amd: Enable SMU 15_0_0 support

Randy Dunlap (1):
      drm/amd/display: correct kernel-doc in dml21_wrapper.h

Ray Wu (2):
      drm/amd/display: Fix scratch registers offsets for DCN35
      drm/amd/display: Fix scratch registers offsets for DCN351

Relja Vojvodic (1):
      drm/amd/display: Correct DSC padding accounting

Richard Chiang (1):
      drm/amd/display: sink EDID data null check

Rodrigo Siqueira (5):
      drm/amdgpu: Expand kernel-doc in amdgpu_ring
      Documentation/gpu: Add new glossary entries from UMR
      Documentation/gpu: Expand generic block information
      Documentation/gpu: Add more information about GC
      Documentation/gpu: Add documentation about ring buffer

Rosen Penev (1):
      drm/amd/display: shrink struct members

Saleemkhan Jamadar (3):
      drm/amdgpu: do not use amdgpu_bo_gpu_offset_no_check individually
      drm/amdgpu/jpeg: Add jpeg 5.3.0 support
      drm/amdgpu/discovery: add vcn and jpeg ip block

Shaoyun Liu (4):
      drm/amd/include : Update MES v12 API header
      drm/amd/include : Update MES v12 comments on RESET API
      drm/amd/include : Update MES v12 API header
      drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx12_1

Sreekant Somasekharan (1):
      drm/amdkfd: Remove hard‑coded GC IP version checks from kfd_node_by_irq_ids

Srinivasan Shanmugam (10):
      drm/amdgpu/ttm: Pin 4K MMIO_REMAP Singleton BO at Init v2
      drm/amdgpu: Map/Unmap MMIO_REMAP as BAR register window; add TTM sg helpers; wire dma-buf
      drm/amdgpu/sdma_v7_1: Add missing inst_mask entry in sdma_v7_1_inst_gfx_resume()
      drm/amd/ras: Reduce stack usage in ras_umc_handle_bad_pages()
      drm/amdgpu/acpi: Reduce amdgpu_acpi_detect stack usage
      drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_cper_records()
      drm/amd/display: Fix 64-bit state pointer passed as 32-bit GPINT response buffer
      drm/amdkfd: Fix signal_eviction_fence() bool return value
      drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
      drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence Update and Timeline Management v4

Taimur Hassan (7):
      drm/amd/display: [FW Promotion] Release 0.1.37.0
      drm/amd/display: Promote DC to 3.2.360
      drm/amd/display: Promote DC to 3.2.361
      drm/amd/display: Promote DC to 3.2.362
      drm/amd/display: [FW Promotion] Release 0.1.40.0
      drm/amd/display: Promote DC to 3.2.363
      drm/amd/display: Promote DC to 3.2.364

Tao Zhou (1):
      drm/amdgpu: fix the calculation of RAS bad page number

Tim Huang (6):
      drm/amdgpu: add support for GC IP version 11.5.4
      drm/amdgpu: add support for SDMA IP version 6.1.4
      drm/amdgpu: add support for NBIO IP version 7.11.4
      drm/amdgpu: add support for IH IP version 6.1.1
      drm/amdgpu: add support for HDP IP version 6.1.1
      drm/amdgpu: add support for MMHUB IP version 3.4.0

Timur Kristóf (6):
      drm/amdgpu/uapi: Clarify comment on AMDGPU_VM_PAGE_PRT
      Documentation/gpu: Add PRT, PTE, PDE to amdgpu glossary (v2)
      drm/amd/display: Pass proper DAC encoder ID to VBIOS
      drm/amd/display: Correct color depth for SelectCRTC_Source
      drm/amd/display: Add missing encoder setup to DACnEncoderControl
      drm/amd/display: Don't repeat DAC load detection

Tom St Denis (1):
      drm/amd/amdgpu: Port over some missing registers and bits from GC 10.1 to 10.3 (v2)

Weiguang Li (1):
      drm/amd/display: Support DRR granularity

Wenjing Liu (1):
      drm/amd/display: add dc interface for query QoS information

Xiaogang Chen (2):
      drm/amdgpu: Don't send warning when close drm obj if drm device has been unplug
      drm/amdkfd: Use huge page size to check split svm range alignment

Yang Wang (6):
      drm/amd/pm: fix wrong pcie parameter on navi1x
      drm/amd/pm: force send pcie parmater on navi1x
      drm/amd/pm: add smu pcie dpm cap & width convert helper
      drm/amd/pm: fix pp_dpm_pcie wrong state issue for smu v14.0.2
      drm/amd/pm: fix pp_dpm_pcie wrong state issue for smu v13.0.7
      drm/amd/pm: fix pp_dpm_pcie wrong state issue for smu v13.0.0

YiPeng Chai (7):
      drm/amdgpu: Add virt command to send VF ras command
      drm/amd/ras: sriov supports handling VF ras commands.
      drm/amd/ras: Support sriov uniras to obtain cper data
      drm/amd/ras: Add ras command to retrieve cper data from sriov host
      drm/amd/ras: Support high-frequency querying sriov ras block error count
      drm/amd/ras: Add sriov ras preprocessing before gpu reset
      drm/amd/ras: Compatible with legacy sriov host

Yo-Jung Leo Lin (AMD) (5):
      drm/amdgpu: parse UMA size-getting/setting bits in ATCS mask
      drm/amdgpu: add helper to read UMA carveout info
      drm/amdgpu: add UMA allocation setting helpers
      drm/amdgpu: add UMA allocation interfaces to sysfs
      Documentation/amdgpu: Add UMA carveout details

Zhu Lingshan (18):
      amdkfd: enlarge the hashtable of kfd_process
      amdkfd: mark the first kfd_process as the primary one
      amdkfd: find_process_by_mm always return the primary context
      amdkfd: Introduce kfd_create_process_sysfs as a separate function
      amdkfd: destroy kfd secondary contexts through fd close
      amdkfd: process svm ioctl only on the primary kfd process
      amdkfd: process USERPTR allocation only on the primary kfd process
      amdkfd: identify a secondary kfd process by its id
      amdkfd: find kfd_process by filep->private_data in kfd_mmap
      amdkfd: remove DIQ support
      amdkfd: process pointer of a HIQ should be NULL
      amdkfd: remove test_kq
      amdkfd: introduce new helper kfd_lookup_process_by_id
      amdkfd: record kfd context id into kfd process_info
      amdkfd: record kfd context id in amdkfd_fence
      amdkfd: fence handler evict and restore a kfd process by its context id
      amdkfd: process debug trap ioctl only on a primary context
      amdkfd: introduce new ioctl AMDKFD_IOC_CREATE_PROCESS

chong li (3):
      drm/amdgpu: reduce the full gpu access time in amdgpu_device_init.
      drm/amdgpu: fix mes packet params issue when flush hdp.
      drm/amdgpu: fix issue when switch NPS1 to NPSX

mythilam (1):
      drm/amd/pm: restore SCLK settings after S0ix resume

 Documentation/gpu/amdgpu/amd_overview_block.svg    |   687 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |    48 +
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |     3 -
 Documentation/gpu/amdgpu/driver-core.rst           |    31 +
 Documentation/gpu/amdgpu/driver-misc.rst           |    26 +
 Documentation/gpu/amdgpu/enforce_isolation.svg     |   654 +
 Documentation/gpu/amdgpu/gc/index.rst              |    24 +-
 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg      |   413 +
 Documentation/gpu/amdgpu/index.rst                 |     1 +
 Documentation/gpu/amdgpu/no_enforce_isolation.svg  |   707 +
 Documentation/gpu/amdgpu/process-isolation.rst     |     1 +
 Documentation/gpu/amdgpu/ring-buffer.rst           |    95 +
 Documentation/gpu/amdgpu/ring_buffers.svg          |  1633 +
 Documentation/gpu/amdgpu/userq.rst                 |     2 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   176 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    73 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |    10 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12_1.c   |   387 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    77 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   536 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   148 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    48 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c             |   315 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h             |   125 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |    24 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   112 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   108 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    85 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   298 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    34 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   131 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   159 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     3 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     3 -
 drivers/gpu/drm/amd/amdgpu/atom.c                  |     2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     6 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    13 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    40 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    73 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    55 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c             |  4067 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.h             |    31 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h         |   475 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    68 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    82 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   208 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    39 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c          |   893 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.h          |    31 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    27 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    30 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   132 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c             |   637 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    65 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |    30 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/imu_v12_1.c             |   166 +
 drivers/gpu/drm/amd/amdgpu/imu_v12_1.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |    41 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c           |   714 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.h           |    35 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |    65 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    16 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c             |  1968 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.h             |    29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |    34 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c          |   916 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.h          |    28 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    17 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |     4 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |    73 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     5 -
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |   202 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c           |   342 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.h           |    30 +
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    23 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    24 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c             |  1817 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.h             |    31 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1_0_pkt_open.h  |  5673 +++
 drivers/gpu/drm/amd/amdgpu/si.c                    |    13 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     2 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |     8 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.c         |    50 +
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.c         |   213 +
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     1 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    44 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |     5 -
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c              |   862 +
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.h              |    37 +
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    45 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/vi.c                    |     5 -
 drivers/gpu/drm/amd/amdkfd/Makefile                |     3 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   729 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |   948 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    97 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     2 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |    13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    93 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    36 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |     2 +
 .../amd/amdkfd/kfd_device_queue_manager_v12_1.c    |    98 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v12_1.c |   391 +
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    63 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |     6 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |   741 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     4 -
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     5 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    37 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   247 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    42 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |    71 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    79 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    49 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |     6 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    63 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    10 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |     4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     8 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    59 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h     |     8 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |     4 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |    44 +-
 .../gpu/drm/amd/display/dc/bios/command_table.h    |     4 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |     2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   629 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    10 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    22 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    31 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    91 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    18 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    31 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    19 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    49 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |     8 +-
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |     3 +
 .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |     3 +
 .../amd/display/dc/dio/dcn10/dcn10_link_encoder.c  |    43 +
 .../amd/display/dc/dio/dcn10/dcn10_link_encoder.h  |    11 +-
 .../amd/display/dc/dio/dcn20/dcn20_link_encoder.c  |     3 +
 .../display/dc/dio/dcn30/dcn30_dio_link_encoder.c  |     3 +
 .../dc/dio/dcn301/dcn301_dio_link_encoder.c        |     3 +
 .../display/dc/dio/dcn31/dcn31_dio_link_encoder.c  |     3 +
 .../display/dc/dio/dcn32/dcn32_dio_link_encoder.c  |    18 +-
 .../dc/dio/dcn321/dcn321_dio_link_encoder.c        |     3 +
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.c  |     4 +-
 .../dc/dio/dcn401/dcn401_dio_link_encoder.c        |     3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   545 +-
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     |     8 +-
 .../drm/amd/display/dc/dml2_0/display_mode_core.c  |   134 +-
 .../drm/amd/display/dc/dml2_0/dml21/dml21_utils.c  |     3 +-
 .../amd/display/dc/dml2_0/dml21/dml21_wrapper.h    |     7 +-
 .../dml2_0/dml21/inc/dml_top_display_cfg_types.h   |     1 +
 .../display/dc/dml2_0/dml21/inc/dml_top_types.h    |     1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |     5 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |     1 +
 .../gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c   |   599 +-
 .../gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.h   |     9 +
 .../drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c   |   604 +
 .../drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.h   |    25 +
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |     1 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |     9 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |   102 +-
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |     6 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |    14 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    73 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |     2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |     8 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |     3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    24 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    37 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     6 +
 drivers/gpu/drm/amd/display/dc/inc/link_service.h  |     7 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |     6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    87 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   141 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   253 +-
 .../display/dc/link/protocols/link_dp_capability.c |     9 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |     2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   189 +-
 .../dc/link/protocols/link_edp_panel_control.h     |     7 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |   165 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |     1 -
 drivers/gpu/drm/amd/display/dc/os_types.h          |     2 -
 .../display/dc/resource/dce110/dce110_resource.c   |     2 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |     6 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |     5 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    10 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    10 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |     1 +
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   189 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h       |     8 -
 .../gpu/drm/amd/display/dc/sspl/dc_spl_filters.c   |     4 +-
 .../gpu/drm/amd/display/dc/sspl/dc_spl_filters.h   |     4 +-
 .../amd/display/dc/sspl/dc_spl_isharp_filters.c    |    31 +-
 .../amd/display/dc/sspl/dc_spl_isharp_filters.h    |    16 +-
 .../amd/display/dc/sspl/dc_spl_scl_easf_filters.c  |   155 +-
 .../amd/display/dc/sspl/dc_spl_scl_easf_filters.h  |    37 +-
 .../drm/amd/display/dc/sspl/dc_spl_scl_filters.c   |    27 +-
 .../drm/amd/display/dc/sspl/dc_spl_scl_filters.h   |     3 +-
 .../gpu/drm/amd/display/dc/sspl/spl_custom_float.c |    11 +-
 .../gpu/drm/amd/display/dc/sspl/spl_custom_float.h |     4 +-
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c   |    78 +-
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.h   |    56 +-
 drivers/gpu/drm/amd/display/dc/sspl/spl_os_types.h |     9 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    49 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    74 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    64 +-
 drivers/gpu/drm/amd/display/include/audio_types.h  |    12 +-
 .../drm/amd/display/include/bios_parser_types.h    |     2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |     1 +
 .../drm/amd/display/modules/inc/mod_info_packet.h  |     6 +
 .../amd/display/modules/info_packet/info_packet.c  |   369 +-
 .../drm/amd/display/modules/power/power_helpers.c  |     3 +
 drivers/gpu/drm/amd/include/amd_acpi.h             |    34 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |     1 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |    16 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |    27 +
 .../drm/amd/include/asic_reg/gc/gc_12_1_0_offset.h | 12418 ++++++
 .../amd/include/asic_reg/gc/gc_12_1_0_sh_mask.h    | 44638 +++++++++++++++++++
 .../include/asic_reg/mmhub/mmhub_4_2_0_offset.h    |   802 +
 .../include/asic_reg/mmhub/mmhub_4_2_0_sh_mask.h   |  3013 ++
 .../drm/amd/include/asic_reg/mp/mp_15_0_0_offset.h |   423 +
 .../amd/include/asic_reg/mp/mp_15_0_0_sh_mask.h    |   626 +
 .../drm/amd/include/asic_reg/mp/mp_15_0_8_offset.h |   868 +
 .../amd/include/asic_reg/mp/mp_15_0_8_sh_mask.h    |   616 +
 .../amd/include/asic_reg/oss/osssys_7_1_0_offset.h |   280 +
 .../include/asic_reg/oss/osssys_7_1_0_sh_mask.h    |  1024 +
 .../include/asic_reg/smuio/smuio_15_0_0_offset.h   |   100 +
 .../include/asic_reg/smuio/smuio_15_0_0_sh_mask.h  |   190 +
 .../include/asic_reg/smuio/smuio_15_0_8_offset.h   |   512 +
 .../include/asic_reg/smuio/smuio_15_0_8_sh_mask.h  |  1113 +
 .../amd/include/asic_reg/thm/thm_15_0_0_offset.h   |   157 +
 .../amd/include/asic_reg/thm/thm_15_0_0_sh_mask.h  |   567 +
 .../amd/include/asic_reg/vcn/vcn_5_3_0_offset.h    |  1783 +
 .../amd/include/asic_reg/vcn/vcn_5_3_0_sh_mask.h   |  8262 ++++
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_12_1_0.h   |   136 +
 .../drm/amd/include/ivsrcid/vmc/irqsrcs_vmc_1_0.h  |     2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     5 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    63 +-
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |     2 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     1 +
 drivers/gpu/drm/amd/include/soc_v1_0_enum.h        |    38 +
 drivers/gpu/drm/amd/include/soc_v1_0_ih_clientid.h |    52 +
 drivers/gpu/drm/amd/include/v12_structs.h          |  2054 +
 drivers/gpu/drm/amd/pm/Makefile                    |     1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    39 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    81 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     5 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    23 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |    65 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    87 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |    29 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   141 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |    52 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   211 +-
 drivers/gpu/drm/amd/pm/swsmu/Makefile              |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    71 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   137 +-
 .../pm/swsmu/inc/pmfw_if/smu15_driver_if_v15_0_0.h |   231 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |     8 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_pmfw.h    |   160 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_ppsmc.h   |   133 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    49 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    47 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    47 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h       |   247 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   204 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |    32 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   453 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   228 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    43 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    83 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    66 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |     3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   267 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    89 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   251 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   110 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |    41 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    44 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   408 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |     4 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   244 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    44 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |    89 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    80 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   263 +-
 drivers/gpu/drm/amd/pm/swsmu/smu15/Makefile        |    30 +
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |  1842 +
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   |  1355 +
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.h   |    28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   168 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    16 +
 drivers/gpu/drm/amd/ras/ras_mgr/Makefile           |     1 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c   |     5 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |    60 +-
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h   |     3 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c  |   469 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.h  |    57 +
 drivers/gpu/drm/amd/ras/rascore/ras.h              |     2 +
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h          |    33 +
 drivers/gpu/drm/amd/ras/rascore/ras_core.c         |    23 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp.c          |     1 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp.h          |     1 +
 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h        |     1 +
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |    63 +-
 drivers/gpu/drm/amd/ras/rascore/ras_umc.h          |     3 +
 drivers/gpu/drm/radeon/evergreen.c                 |   112 +-
 drivers/gpu/drm/radeon/pptable.h                   |     2 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    66 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |     6 +-
 drivers/gpu/drm/radeon/radeon_i2c.c                |    15 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c                  |    26 +-
 include/uapi/drm/amdgpu_drm.h                      |    19 +-
 include/uapi/linux/kfd_ioctl.h                     |    14 +-
 include/uapi/linux/kfd_sysfs.h                     |     3 +-
 424 files changed, 120477 insertions(+), 7107 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/amd_overview_block.svg
 create mode 100644 Documentation/gpu/amdgpu/enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg
 create mode 100644 Documentation/gpu/amdgpu/no_enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/ring-buffer.rst
 create mode 100644 Documentation/gpu/amdgpu/ring_buffers.svg
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_1_0_pkt_open.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc_v1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_2_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_2_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_8_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_8_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_8_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_8_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/thm/thm_15_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/thm/thm_15_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_3_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_3_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/gfx/irqsrcs_gfx_12_1_0.h
 create mode 100644 drivers/gpu/drm/amd/include/soc_v1_0_enum.h
 create mode 100644 drivers/gpu/drm/amd/include/soc_v1_0_ih_clientid.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu15_driver_if_v15_0_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/Makefile
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.h
