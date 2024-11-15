Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18DA9CF213
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1189310E8A1;
	Fri, 15 Nov 2024 16:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M1LWxBk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6E410E8A1;
 Fri, 15 Nov 2024 16:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLEddrz6v9Bm+827s5Q2p+GKl9r1YPX/+uy9ZnC7KyNW3RZDMTXZzmCGBUP51cd64XuWaR/lCNCFcdBnxnhpfmH6jHGfgOFEZ/Q9D76BTLHjvZr92jA0RJDyrgCkWg5txDl4LXaPyAZcESJStvK4IZPwxe6n0MUiMS7d/JoCSbjXOOsrVBdsZ8ZnACzcamE8C1TrmtvttAJZMgIh7qtnPvF1KHS5F9kroKDvC6Uf3b46LvBS+YFoD2dvTLGwdWfNzeIdLF/n3knKNEw/FjD8bxCj6tv5rMtMp4DKLaESP4OfD/A4embaDDkBgmlONZfHIWpjcp0vYMJvXW70BDOLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVTkkTVycyKJX+RFAWgNXSOgAM5jHvAVT/WiGV/VygE=;
 b=zHInSYaOgRHWAMWx5ob67UeXyQ6kqTdoN7i4dw1rVOCTrFxuVW2KGKtVHP/aV5Y3pxvN7p/MO5tHgGN/COLw9PW4/Thj5y/duzE8pLSleKElcZO0NtwoIebTyuQCyQtlgxox8qSdwUIRO+Dgd7DXAolylnZ7ErdApk6wcwafhR5AnteWB0UNRX6TrjEKOMP+XB2Tgbxi0DbvqtmRMjm2+UHN38MZKTiE1yKsNeww58ShxdbYIHEbmpEYwc5xXBX8JAwpd20ZtBS7H4y9f2bumRZLAzxSIGGYac9JWuFOQtqqgTwCyzkfm05LLf0D87/AzzErK9desxjgkTxEfQ/Cag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVTkkTVycyKJX+RFAWgNXSOgAM5jHvAVT/WiGV/VygE=;
 b=M1LWxBk75tdEqC3vT29rluWI7SWa8LOnf1jEEjLo+AZXg7zOcLQsm4i980Zu1y8Ub8E6F30xWywCsigJAWZTVMVuzvEW65cOxEjb0geY87YVFP7rwtN48mo1rLqETf9I6H6CTBhHNmezyINusqR7S6dwuvit8foH3oYiwZ7PZc8=
Received: from BN1PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:e1::7)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 16:50:29 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::3a) by BN1PR12CA0002.outlook.office365.com
 (2603:10b6:408:e1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 16:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.1 via Frontend Transport; Fri, 15 Nov 2024 16:50:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:50:27 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.13
Date: Fri, 15 Nov 2024 11:50:11 -0500
Message-ID: <20241115165012.573465-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|BL1PR12MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: e184ca69-a914-4e0b-ab51-08dd05959c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2NhVmxLVFdqUDIwN2NxckpiejgrWktOQkpHSWk0cnR0dFduRmo2cDA4WHJY?=
 =?utf-8?B?VTV0K1BYaXZLTW11Sk8yNnZCM01nY3JNczhUdFRrcHFkVXBzYVVQWjJqTEFT?=
 =?utf-8?B?bzV3VFR3T3JPMjFUQnpJd21mendIMkxFY3pkVFBYalVJc0xhS1hYL2N3Vk54?=
 =?utf-8?B?ZjN5V0tnRzVxbVRYWUIwQzNiY2ZzVGxmZFo3UUIwMzhNbTRqV0hMVkI5bmxC?=
 =?utf-8?B?REE4MVZKNHEvL2Urd3N3MittVlltWjVlRzJJNGV5OS94bTFpQmtHM2xwcEpO?=
 =?utf-8?B?QVl4Mys1dmh6WW9zLzk0VkRLclJZZmFyWG1kbzRnYjdiNlFaUW9kM2NnQTEv?=
 =?utf-8?B?UzZ0U0RYcWxzTWtFOUdjUnQ2enVicVpaa2JwR3JUSmduNmFhL3V3SkxzdEJ5?=
 =?utf-8?B?UGVxV09IeXBSYVpKbks5aXBzcHVrRCtSWlZjazZ0S3pQaDNlNzN6VXJ0RmQ4?=
 =?utf-8?B?V2tDQkJQcEhuMmpJdjlyNDkzeXpaMjNwTG1BdmhtVm9Hcis5NHNyRm5PRDVF?=
 =?utf-8?B?SUFiYjduR0cvMThteU1yTXJhRHJidi9odStJWVRSQmtzbC92T2pmMjEySTBB?=
 =?utf-8?B?Qkpza1YvdHd2K2tzV3dod2dKQTJKVHl1TTRvRHZ4TVVBQy9vSkFudUMvbEF2?=
 =?utf-8?B?bVdoZ2liaDJFMmRsbkhta0VnZ1RkOXRYYmlXeWRmelBIc2VkK0psSkZqRVRs?=
 =?utf-8?B?MlNoUVgwZzdsZFBZMTJGRTNHcC8zQjlUMHNFU1ZoZUgxa2plMEFsVVF0cHdG?=
 =?utf-8?B?cy90bE85MkRCTTg4bVovRkU3dFFPM3hscVVyNTVMdVRRK0sreXU5VDZramhu?=
 =?utf-8?B?SHhOZ1psbEMvM0w4NG55NVNGZmNYQlZoaGhLa21ZYm53MjQxc0YzS202UjJa?=
 =?utf-8?B?ZExSQlYvUkRsWm9sZzd2dnBkS3ZtS004aWVhOTl1V2ZxVW1Zc0hzUWJqWFlM?=
 =?utf-8?B?S0pwZWVNTGlzV0thbUsxWHp3Qk4ydUJzWlhKWEJDbENSc3VHWDRKTjRUOENk?=
 =?utf-8?B?cXM5V09qNHVTVGlUU0Z4Zk1OOFBTMXhGQ3dKTk92b1QyVllPaytJM1dLbHpk?=
 =?utf-8?B?Yk1iL05jc1VqczAwTDNqZklzNTI2eGd1U09FdmdSNm5LcENqMm11WmVjcTZm?=
 =?utf-8?B?M09XcG1PeUdTWi9hRHFwU0VkRTcrb0htcDJzclBNUktKcE9ramxHcmtGK09W?=
 =?utf-8?B?aHlxWHFkRkxFMExLZUw0RW1rdmVDWW9zajdtNEFlNjluV0lIRE9yRDdOLzdC?=
 =?utf-8?B?cW9YdFRKMFl2cC9tL0QrWnBmcjRRdnBjSmFUS2pBVitHNTF0QjdWM2dHam9H?=
 =?utf-8?B?UDhaMnkwbGxqdG1iV2EwTExUQXRxR0JTK0g5angyYmlzdGVYbWk4anUzMWZp?=
 =?utf-8?B?YXdsUjF5aTREcVpueSs5ZU9TUjZaMWUvc0tpTWVycDRsa1ZxWHFNWVZMRzVG?=
 =?utf-8?B?WXhjVW0zeHNNNUNnZEZzNWx2aVhmakUxUDVtNGZUME1ZMGp4WG1Xc2pnZzRq?=
 =?utf-8?B?Wmt0RHpFMC81RWV4K3dBdVEwS05sRVFWaW5CKzloSWZLVThHWGtoWStYdnpU?=
 =?utf-8?B?QXFJRi81UUw4RjVnNmtjaWVBRlZsNHU1b0NIcEIwVkZwTTBrYW1FN3l1OHFX?=
 =?utf-8?B?YzFnYUpyZHhKMWlsSExhNWZtaWxRSDdOZGs5UllXVTRBZ2IvNUhHMkpiTjZ5?=
 =?utf-8?B?eFNFaGFzYXBnNlA1NE5TWXlnTCtmTmprV1ovNlYzZjdJdGNrYmhUellWTDQ3?=
 =?utf-8?B?Y3c0bWo2Njlmd2NRTFdXTzNLcmR2UUlCczZTRGZlWXRGRGd0Tm9LcWhCYUIz?=
 =?utf-8?Q?sHDYRIR+rj9+pmtHF8NwdTnx1tJK2BggR/6KQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 16:50:28.3612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e184ca69-a914-4e0b-ab51-08dd05959c24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852
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

Fixes for 6.13.

The following changes since commit 35a6e15aabc016a241379c09d6c367519709b95b:

  Merge tag 'drm-etnaviv-next-2024-11-07' of https://git.pengutronix.de/git/lst/linux into drm-next (2024-11-08 12:32:06 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.13-2024-11-15

for you to fetch changes up to 447a54a0f79c9a409ceaa17804bdd2e0206397b9:

  drm/amd: Fix initialization mistake for NBIO 7.7.0 (2024-11-12 17:10:40 -0500)

----------------------------------------------------------------
amd-drm-next-6.13-2024-11-15:

amdgpu:
- Parition fixes
- GFX 12 fixes
- SR-IOV fixes
- MES fixes
- RAS fixes
- GC queue handling fixes
- VCN fixes
- Add sysfs reset masks
- Better error messages for P2P failurs
- SMU fixes
- Documentation updates
- GFX11 enforce isolation updates
- Display HPD fixes
- PSR fixes
- Panel replay fixes
- DP MST fixes
- USB4 fixes
- Misc display fixes and cleanups
- VRAM handling fix for APUs
- NBIO fix

amdkfd:
- INIT_WORK fix
- Refcount fix
- KFD MES scheduling fixes

drm/fourcc:
- Add missing tiling mode

----------------------------------------------------------------
Advait Dhamorikar (1):
      drm/amdgpu: Cleanup shift coding style

Alex Deucher (1):
      Revert "drm/amd/display: parse umc_info or vram_info based on ASIC"

Aric Cyr (1):
      drm/amd/display: 3.2.309

Asad Kamal (1):
      drm/amdgpu: Add supported NPS modes node

Aurabindo Pillai (1):
      drm/amd/display: Read DP tunneling support only for DPIA endpoints

Austin Zheng (1):
      drm/amd/display: Update SPL Taps Required For Integer Scaling

Christian König (2):
      drm/amdgpu: fix check in gmc_v9_0_get_vm_pte()
      drm/amdgpu: enable GTT fallback handling for dGPUs only

David Rosca (1):
      drm/amdgpu: Fix video caps for H264 and HEVC encode maximum size

Dillon Varone (1):
      drm/amd/display: Require minimum VBlank size for stutter optimization

Emily Nie (1):
      drm/amd/display: disabling p-state checks for DCN31 and DCN314

Fudongwang (1):
      drm/amd/display: always blank stream before disable crtc

Hamish Claxton (1):
      drm/amd/display: Fix failure to read vram info due to static BP_RESULT

Jack Xiao (1):
      drm/amdgpu/mes12: correct kiq unmap latency

Jesse.zhang@amd.com (4):
      drm/amdgpu: Add sysfs interface for gc reset mask
      drm/amdgpu: Add sysfs interface for sdma reset mask
      drm/amdgpu: Add sysfs interface for vpe reset mask
      drm/amdgpu: Add sysfs interface for jpeg reset mask

JinZe Xu (1):
      drm/amd/display: Use region6 size in fw_meta_info

Jonathan Kim (1):
      drm/amdkfd: remove gfx 12 trap handler page size cap

Leon Huang (1):
      drm/amd/display: Refactor HPD IRQ error checking flow

Lijo Lazar (2):
      drm/amdgpu: Fix map/unmap queue logic
      drm/amdgpu: Avoid kcq disable during reset

Meenakshikumar Somasundaram (1):
      drm/amd/display: Adding flag for forced MST blocked discovery

Qiang Yu (1):
      drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X

Ramesh Errabolu (1):
      drm/amdgpu: Inform if PCIe based P2P links are not available

Revalla Hari Krishna (1):
      drm/amd/display: Change parameters to fix certain compiler errors

Rodrigo Siqueira (2):
      drm/amd/display: Remove unused code
      drm/amd/display: Adjust VSDB parser for replay feature

Ryan Seto (1):
      drm/amd/display: Handle dml allocation failure to avoid crash

Sathishkumar S (1):
      drm/amdgpu: Normalize reg offsets on VCN v4.0.3

Shaoyun Liu (3):
      drm/amd/amdkfd: add/remove kfd queues on start/stop KFD scheduling
      drm/amd : Update MES API header file for v11 & v12
      drm/amd/amdgpu: limit single process inside MES

Srinivasan Shanmugam (2):
      drm/amdgpu: Add documentation for enforce isolation feature
      drm/amdgpu/gfx11: Enable cleaner shader for GFX11.0.0/11.0.2 GPUs

Stanley.Yang (1):
      drm/amdgpu: Support vcn and jpeg error info parsing

Tim Huang (1):
      drm/amd/pm: print pp_dpm_mclk in ascending order on SMU v14.0.0

Tom Chung (2):
      drm/amd/display: Change some variable name of psr
      drm/amd/display: Fix Panel Replay not update screen correctly

Victor Skvortsov (4):
      drm/amdgpu: Update SRIOV Exchange Headers for RAS Telemetry Support
      drm/amdgpu: Add msg handlers for SRIOV RAS Telemetry
      drm/amdgpu: VF Query RAS Caps from Host if supported
      drm/amdgpu: Implement virt req_ras_err_count

Vijendar Mukunda (1):
      drm/amd: Fix initialization mistake for NBIO 7.7.0

Xiaogang Chen (1):
      drm/amdkfd: change kfd process kref count at creation

Yang Wang (1):
      drm/amdgpu: fix ACA bank count boundary check error

Yuan Can (1):
      drm/amdkfd: Fix wrong usage of INIT_WORK()

chongli2 (1):
      drm/amdgpu: fix return random value when multiple threads read registers via mes.

shaoyunl (1):
      drm/amd/amdgpu: Increase MES log buffer to dump mes scratch data

 Documentation/gpu/amdgpu/index.rst                 |   1 +
 Documentation/gpu/amdgpu/process-isolation.rst     |  59 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  53 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 130 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  45 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  55 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  23 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  77 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  41 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           | 189 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  23 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  43 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  48 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        | 131 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  20 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   7 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   6 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  13 ++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   7 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   8 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   8 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   7 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  27 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   3 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   9 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  18 ++
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  23 +++
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  18 ++
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   4 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  12 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  15 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   3 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  40 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  19 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 140 ++++++++-------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |   2 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  11 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  13 +-
 .../display/dc/link/protocols/link_dp_capability.c |   8 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  16 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |  13 --
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  15 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  35 +++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   4 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  43 ++++-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |  31 +++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  24 +++
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |   5 +-
 include/uapi/drm/drm_fourcc.h                      |   1 +
 78 files changed, 1452 insertions(+), 243 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/process-isolation.rst
