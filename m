Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA549C8CE7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 15:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FA810E2AC;
	Thu, 14 Nov 2024 14:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ssY7GG73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3CE10E2AC;
 Thu, 14 Nov 2024 14:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcT0CB2aqbDoAHJSJ6VqoG8QPX9oYMiSURGLkG7iLV+2qHLXedatQi1BKfnDzCu+1zVNpHCdb4r2MPArlW9WLNS+eqQK4Ch7pRPVU+0PihI88Fa0A/KQ2zWHe5C+UGKupjVaV3QNWBKrvZZpEY/sJh8NyKcrDFuamWmj8PsZJsZq5z6xQKWR6LOEsI3Fnkk09JuRcPrmDeoPV3BfK2CMGQmkCPDy8DpbxgM/0JJ2I1Us2uq0D9IilCiwbBob2p87nnOVDCOs5KHZahax3mTo5UOlReawqNbpJ3kxtmF6dFk35+L7yIZ7ATac6QWQUuKadpcRte8hMWZXQUpfVxyjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ycoh9kQ0+nCSmvJngycpLvr/1w6UoKBdSnNRf8B+skw=;
 b=N6WEEppT7VTKE81iHrw3pGa0mKiidbWSU8FBYhCX1h6MpsCIi1tFJ6mE5cz359hEM59kuTawYcJslX2I8lz1h4xENLAJXZ1iRPMVrID63CHWzGnI6kjpMjJ41UifFsgFnx+y58jZ8fHZwPJ+BOeN/xvDqPIHDuT/ZXB49cWJtevPF/yNHWfxwPnM/MRAk+z+DjbUx/G9Kjp5BYMe1feQDaxiE4z6zINrzjOsZzerVypnVqDUdMFQ10aoads36ovLEbpPqI/8f6ehcYrK+0t7GLkh82Jo35mthldrSjPcrRadqRiPMwPptqiJqmL11LCq7mIULXoVdwpb5UEy9ygKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ycoh9kQ0+nCSmvJngycpLvr/1w6UoKBdSnNRf8B+skw=;
 b=ssY7GG73f/VIj6nbfHNYU9f2DxfKGi03HZX03niu7jYmKNivTKcw5BVT8PirIhHa1YQNpsgzUv3G+3f0iWyp5Q9ttHzU9Z5X6rhV1lso8AVJgoVkdXmdx/cdfUi5aNxt5f1GVTEqoTHWZWU5D27NZUyU82843Q+1ZNIR3aEikgo=
Received: from CH5P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::8)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 14:34:20 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::de) by CH5P223CA0013.outlook.office365.com
 (2603:10b6:610:1f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Thu, 14 Nov 2024 14:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 14:34:19 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 08:34:17 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.12
Date: Thu, 14 Nov 2024 09:34:00 -0500
Message-ID: <20241114143401.448210-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: d397348d-bf63-4f42-f815-08dd04b96cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OCtMaDlOcnp2enNSR0FXTHdZRGNhb0prZm81Z1p4MzJaSlp3U3RLQVdyaU5M?=
 =?utf-8?B?RVVXdjdtSW52VWRRWFpGeDdGRWRvWlFnZ2laL012dXNRT1RrYmVmc25tL3Ju?=
 =?utf-8?B?cFRwNnpWazNnSGEyWW16OU80dm12UHpwUUFUVVFNYjZGL1RkYSsyc1NkTVd3?=
 =?utf-8?B?R1BIRGQ5NThjSmgxL2dud2pNLzA4ak5oZWFXaUViK054SFpMQnorNy94bXhG?=
 =?utf-8?B?eW45TWRsdjRQcFJDRDVqeW5mUFpDNmZseGtvOTgrd3RVN1ZGT2VkMUpIQmhr?=
 =?utf-8?B?ZG1jb1FyZWZ2MDJwc0YyKytpQnR5Yld0VCtKTG91UFZhZUxWajFsN2k0endQ?=
 =?utf-8?B?OFFOR01laUc2Mkc1THNYZUJqcmU1WXA4NG1ObjBQZWxLODY5ZThDdXQwSmNL?=
 =?utf-8?B?U0tNUXJlVm1JdG1TUHpZQi9wK0dsY09IYnBwaTd1bVpqMVFTNE11TnY5blBU?=
 =?utf-8?B?SmhYZ3pnRkxLWkhsQ0lVWFZqTTViWmhHUUF4eWFXem1mRVlxVEdyVFlVVUN5?=
 =?utf-8?B?SlEwYmhBeXdpM0c0MGZxeUVING1MUitteSs2c3JXU21TcTNWckkzWUQxYnJ1?=
 =?utf-8?B?OXcvdFQxRlBsWDQvcjVkejEvMDZBUUFRc0U5MTRYRjV3ODQrRFV6N1k1S3ZN?=
 =?utf-8?B?M0hBeDZ0VHlMeHA4MjQzTmFnN0IwMDluSmUzNWhraVB0akpRUE1QZnlpNEpM?=
 =?utf-8?B?S2MwSTBUOHk1YXhLU2U3Ymd5SlpuQVIyb3hoazM4K3pHK2t5YW10ZDhoUlpU?=
 =?utf-8?B?bFIyZ3NIdzY4TjNBSndDbnB5emJVbzRJaTMrNUNsZW5RVGJzajVHMXlWWGpo?=
 =?utf-8?B?TDZvOSsrY2RGdk5udWNtWUFoUzBqL3Byaml2VUgzMGZjYm93TlNYRkpiZlBv?=
 =?utf-8?B?RFZvaU10SkdJTzdmcU1LeW1UTFNSVUViN0NjN2FZNGxuODBFbnhZUWNTR1k5?=
 =?utf-8?B?TWJSR21JTzZTeitKMC9yaW4vdHYvcEJBUDcxYUVMTEpObUVnaVErRHJadWdM?=
 =?utf-8?B?eVRVNWd5ZE9IU3lVaG9OZ2NHaDl2KzNTRWRWeVhucHNROElGS1JXQ05MWHlM?=
 =?utf-8?B?dnJEZTZycnAraHpidDNVcFp2eEhoS2tmdks2ZjB0NnZ6dWZoSWlaQnF3U3kr?=
 =?utf-8?B?ZUhaSFR1d0p4cVZ5bE1kelBZOTdFemdTZ0gxRWh0N3RPbDhwVVJBVDN5eC8y?=
 =?utf-8?B?QlUrQjZFTUluV0tRSGE5bVFOVU9pUUl5bUxYa1RFQVNLN3d1L0MvQ0pnK01r?=
 =?utf-8?B?K1VIWDhZRGEwSUtra3hpTG9FQTR1ZFNOMktwaTI1elV0bmU5NzIyWDB1aDht?=
 =?utf-8?B?d2s0cC9QSVAycjB1L3J6TmxTS0F0a2Z5ajNWZ3V3VUxiOXg4OGY4ZE5uZFRt?=
 =?utf-8?B?ZmMrVGRaWm5rTmIxL1dWbitWUGRaNFFmaURZSUtzN0JheEFWQW9xQXRJKytM?=
 =?utf-8?B?TUVSczdkZk9HVXZlSG11ZlJ2L01qOXJUOWc3OGVjZDRIeFhlZHpLbFBkMHBt?=
 =?utf-8?B?cDF1amJTQ05MUkNoLyt5dVk1am0wZ2QxVUdmQVpTUmM5R3E0VDlYQmw0MVNK?=
 =?utf-8?B?dzFvd2hsT2pWWUdXdU5MRU5WMTdXUDRrSUM3UnBVRjlnQUo2aEdDRjR4Unkv?=
 =?utf-8?B?Qks3ZDZnWlhyaXZTOFJpV2dnRHNFd3dmQXlOa3l0SnlaeE4wNzdacjB4VU5h?=
 =?utf-8?B?dDRNUmx4RDl1YlNKblFQWVVlK0ZKUW81TlgxeStiYTA2UWd6aGtJdHk3OUVk?=
 =?utf-8?B?RnN6bkJEcWFGQ2U5a3dQbC8zeFc3bTRXWHdkL0hjWFhCUFlXbzk3S0RYUXg1?=
 =?utf-8?Q?juJ25jEiRQboi30ATLt+gNqhexVQdr0NJUyE8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 14:34:19.8824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d397348d-bf63-4f42-f815-08dd04b96cef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015
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

Last fixes for 6.12.

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-11-14

for you to fetch changes up to 7013a8268d311fded6c7a6528fc1de82668e75f6:

  drm/amd: Fix initialization mistake for NBIO 7.7.0 (2024-11-12 17:37:39 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-11-14:

amdgpu:
- PSR fix
- Panel replay fixes
- DML fix
- vblank power fix
- Fix video caps
- SMU 14.0 fix
- GPUVM fix
- MES 12 fix
- APU carve out fix
- DC vbios fix
- NBIO fix

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amd/display: parse umc_info or vram_info based on ASIC"

Christian König (2):
      drm/amdgpu: fix check in gmc_v9_0_get_vm_pte()
      drm/amdgpu: enable GTT fallback handling for dGPUs only

David Rosca (1):
      drm/amdgpu: Fix video caps for H264 and HEVC encode maximum size

Dillon Varone (1):
      drm/amd/display: Require minimum VBlank size for stutter optimization

Hamish Claxton (1):
      drm/amd/display: Fix failure to read vram info due to static BP_RESULT

Jack Xiao (1):
      drm/amdgpu/mes12: correct kiq unmap latency

Rodrigo Siqueira (1):
      drm/amd/display: Adjust VSDB parser for replay feature

Ryan Seto (1):
      drm/amd/display: Handle dml allocation failure to avoid crash

Tim Huang (1):
      drm/amd/pm: print pp_dpm_mclk in ascending order on SMU v14.0.0

Tom Chung (2):
      drm/amd/display: Change some variable name of psr
      drm/amd/display: Fix Panel Replay not update screen correctly

Vijendar Mukunda (1):
      drm/amd: Fix initialization mistake for NBIO 7.7.0

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  13 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   6 ++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  12 +--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   4 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  12 +--
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 117 +++++++++++----------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   3 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  11 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |   5 +-
 17 files changed, 117 insertions(+), 96 deletions(-)
